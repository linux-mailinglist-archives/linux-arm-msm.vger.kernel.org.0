Return-Path: <linux-arm-msm+bounces-103303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD16CXSq32mOXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 17:10:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC9405B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 17:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2292E307E341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C068199FAB;
	Wed, 15 Apr 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw+M3cHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkHoYGpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0663D3337
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265495; cv=pass; b=b9rO2AWd6f0qQq7TqICToO7TQCjA3URYM/vXc1FEcVrorvtCCK0NxknoYt/lWYF9PK1gkw2i8vf2jBB+xvz4GRURpPndxvk0Ai0EweF7H2zDzs0oXTCIbN72/UW1kI1735dwaFNmOYo7pJtunyNhgRvaiZoXbKVzhHjTFNXqK+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265495; c=relaxed/simple;
	bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E88gTvmMs2QHs3LgbxvQ+KMdgmeyTZrTUZBVACOIzbvDgbDB+ukWSPchYVDSFxZBV+935ZfJ/jFVPjf7kqeHcGLe9svc5HLvwVRCV0Lq+cKD2FTrVAOAho/sIBxaZ1ragmEsRlQyHe73Abbq1fI/QlxTlHYEtag7SnZ1UxuHMow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw+M3cHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkHoYGpt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FEoTHV2834783
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 15:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=; b=fw
	+M3cHGs+7LEwwds+pwdn8AcXhx7lB33loKA74OBywFOIFUn7VawDpXXzCZIL+cmj
	N932L0wO9lpYKl0H+zltcnsIBBQp3bizglCXvrr27O3Wc73oQ1Wuv607+cdbJtyy
	ieqqu+i1YWJDlVXsc1JzAP8cRm5s31qrWO9fB8chbaXOhc3L2zvsJZzjq+pVJB3p
	awOjCk+TGUJtw6XW/iPm3vhOIIKvvrk3/U7ccEaJNkefwn+6km9kIkdQUaKhceC5
	onrXQT7z3UJKDjqyvi5c6fpl3WYLPgwengTuxB45yjXKwOgftc4P+vBS6+g5mZmH
	3OeOVeNEOW568k16vXEQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvg1qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 15:04:52 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68478472f7eso14023794eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776265491; cv=none;
        d=google.com; s=arc-20240605;
        b=F3MKaga+qbeoBEeQjLcrcRf4N5lF1K+l2aBZr9JkgCRWc1HWrH7glZ5BnWlt9Rpbgi
         EB10BCw8LRJg8LvB3mAiWAOdR+gU6sMxYaVC2qkbjjSrZMzyxEc7rOUOVSj/VBgw2Ci1
         kCLQX2lHCM3Gi6I++RUMU66FJHJbsKFq6IZTSkS9b04qX2fEA8OEDhF896dqIbtO9xTg
         qh7UWeGZaD08636644X1i4T3s156vMz10SBvPVQjExXn/syQ1PCE26VfZXO1tzni5THL
         RRj0WsE8I3oUzWh1/E9MxVNkhWK0lfgZwsnjo9snEiYNtjINz0fIErom5jMw1B5eP8Pq
         2sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        fh=XOLS92jiLxyGU2w3KYR+5J8yeCg4byiIyMAqRy7Rm2I=;
        b=MDnhTUu2l4n/+Dy06hOldBxLwPZSpcWIO6nW1NcuM+4Tvs2IMTm4hhaAjOyhl/ulrX
         PPJYV/tiibdmoOJjJARRsR82lbUwEjusJbTz5S1Tpn6eIau/q6X+ARA2XPTqMV61PzI2
         UGIssppcXVEL+tWqcaJpHGNPp0BB3wXvzzGUPuq+i7wLg9MpZWsHE37IJt5PwC4HFqe9
         uU0/dkyyA8gT0XpWTv529CMZHHYtPj3LqSrkTD0herFNSBOuTzS0obx6GBl3tKsOFzYM
         AhPwoFP3sfQPcJEHqJGYeJ7i3L8Oxy75xjOpJJ7O/d9sZSoFWobiqdWgTLCbTw5DB7wQ
         FMZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776265491; x=1776870291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        b=OkHoYGpteGQOMV4RNU7UawuR19Y0JOXOjXoRzoCsPrX93tm04Vqqr0u29o2DA4uwbg
         T7gQyzQvy1QYoV3q/a4w/jn0JBGRDyeVM3cmvR3ZxlItA+nBZbmq3rlkMrjRwr2xfAAv
         uwrJJHq5xq8aUcaPy/T1sveK1Z6knNzc7bRgEW5GhxJj7TjhN/mdvs01VYLKQesvSGPq
         vLpdFEmFIn2Tx9qo3hEiTg8gDdlkDf5sAZrXspS/nyXtYTmD+8vfupDbmkqGhcEDvz1e
         uJyxoRIQwIq/dN9ixaFBQCZqbGnqyh2O7hDsAYxMUAgTnm90KH85TMf2qV47icQZEYXm
         Qglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265491; x=1776870291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        b=V82FNEpjLcdFNVIb6BPoibLYAkavSE8V3JyMMQYFjdo+D4XDTJNKK9LbrC1s1CwbF3
         5mzupXqYrRpjZGGKoUvfQDTZt4vw6jkBvcB4+MhXS5zICflWYuSfBPyL3LunfqAZMsSw
         pltWhQMAU6qSYvd33iiYg97914o/FL9tLwGjwrc37OFl5D+2+lZzpqPbhDGv/y6Zx6hW
         Ze5Y5Stz4eE3Vlt095XO526V/TFgbDD0LHey07nUaFtLv4ujIUQb3110w1ORHHSuOnd/
         ULvR3BnMZinaNi/n7W676bWWvxf/X31IuzHC21rTsFbnqpK+SxmyG/oZ1JK3dVKOxDlE
         x2Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8X3OdrUPdgiWRqPvGB0bxkIR1Eh3xCmJNVVv/th4pCvjz/ypDW1YGVPVtEbimdPie03JQ/Qk0k+Q1Pgyt0@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZp9CvJq6g3FKLKOWTXGEnWIvuAOEVUn7/Hdi85lbvim5Dcct
	2A8PwCgeit7xbkb8PD8OmdKmJ/5DKhff06Pcb7i6rj84FjEVBSxk5bCiidn/78rWI+qdyCvMfWY
	QTHuNffdWF8fHV77BgqoWyfE1O+xL6+J00gK9+3gn6Ccr3+BVppDfk0QNiJ3w9Ju9nitjZUWvNg
	wI5jjLkNlDbtH3SYQ3g9LRtmXjJR87B73NuqzH5IWwudM=
X-Gm-Gg: AeBDieuMKzx/XV9XDynbahNnhR2XYkgETHEh5duFVy9qY09RCnByv1bOaOmX91F1hdw
	I2ey+2KZDt3KhU4zH2+/Oot+vDwUv+L7uj4II0Q32e4AtWzOAi5WVn2Ov+XCL8P/2nptawCPjfP
	Zw0f8bDIQDDKL94vN1d48jxVAt8UVHAC0cbLXXBz7iShJRdzHUIIEtGVP0Bo2KTo0L4D2tEAdLT
	Vz2Vuvztq4Lx2Umi9nsqo/LAa8gCEMZYnfe9Q==
X-Received: by 2002:a05:6870:d1c6:b0:409:6227:d313 with SMTP id 586e51a60fabf-423e10e4bb5mr12821195fac.35.1776265491263;
        Wed, 15 Apr 2026 08:04:51 -0700 (PDT)
X-Received: by 2002:a05:6870:d1c6:b0:409:6227:d313 with SMTP id
 586e51a60fabf-423e10e4bb5mr12821108fac.35.1776265490753; Wed, 15 Apr 2026
 08:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com> <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
In-Reply-To: <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 08:04:38 -0700
X-Gm-Features: AQROBzC2ZxkOJ0HY0hvdTt9PTVU7VKw9IIw6uIzUxBLIym5bcPEvwHU4RlF6Xjw
Message-ID: <CACSVV00RSbV5-BsNwzAaTkJGHx4EKnek6WZJxEUdREmyT92HxA@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fDDjIMschBObZUyp4_66mRsXwi7KVkWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEzOSBTYWx0ZWRfX1BALmErfh2nI
 79UzWKyfi9AkpoyWUnKRZE7BGQYG3yJjhHcDy8GPV0Wp7ptRUM/Mp6l0l7uZ2E5n3ZChCkO3h0/
 GqcSjQzQv02j6LvYJDb6eapNq/lTuyN4cKVqddxhXJHgvxa0nCoHaqgEcAJDB41U6j6UdohzcVB
 pH7muUSWmmuhxV9Hk6rHd4xEagVmj0WwyztOSnch1suVXjCoAIr8a1nR9qisjdrITfGeUcvTnx1
 YMmykSn05qNTD85YjaRa4Xhh+E9FwHTqaIybXb+00NUAELOEiAHDapQoS1dVPE8chZMryAXnP4X
 KPKC+x1Cd3JDTY1nbbTUHaDbtHf1htPEmps92r/Zo5E1T7jZVAKozCXLvmRBBXMLlqOM6LKSMn8
 k4AXUHPr0V0S/RuSaZGzpG6e7hGxtseVLYolkwpsLo482itJMrOYlV8u2yIE5STsreAMFxoPmCQ
 lpc2MlAkiwtftnTF9VQ==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69dfa914 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=emx6X9--i3bWQemKjywA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: fDDjIMschBObZUyp4_66mRsXwi7KVkWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103303-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 66BC9405B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 2:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> > Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> > The Glymur CRD boots Linux at EL2, which means it doesn't require the
> > secure GPU firmware (zap fw).
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> This isn't a blocker per se, but since there is no more zap, do you
> think we can just enable the GPU and GMU by default (i.e. no status=3D
> "disabled" in SoC DTSI)?

Agreed.. I'm pretty sure zap was the only reason for disabling by default.

BR,
-R

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

