Return-Path: <linux-arm-msm+bounces-100485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CIZA9EFx2nWRgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3734BFA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C306305A402
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3049333AD91;
	Fri, 27 Mar 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/0vK7md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmN5a46w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0EF1D5170
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650673; cv=pass; b=eI3OFy39CSMBXtPgg5jFWm5fiJk7acqv3381h0t9netaHSJfkC3I3wOKrqxUgRh1QiMxM5O5NWjnK2BJNvZdp6agisYSA9/X3YF1wPSP3EcVgLncIG30G9roVOBpCxVqwA1+LZlM+zBqaz+MxBYlDeHbETmwDGDzrEPztl6p+Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650673; c=relaxed/simple;
	bh=7Wd4WaS9Tw2LVyuZGToThgOcjG4eTJFKipKnBT6ahmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPW3Ee1G6FQ33TUs+uCaahzsM1t2+OzqQh8AKMioMcNqO/kH0+1eSU+sNG0E6EwhX3erEsMlqQm/UNNIExDChLrQFqOoSUbwmHZ9fKKlwYyuTk/LbFnLX19tw7Uh47nDJ8d1Y4x8s/IArvaGWmJfKdigu+uUq+FQhlkBAyfb+lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/0vK7md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmN5a46w; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfmM53662317
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v7WKFHZa01ynUTDVkoNUyIYc
	RPr9NH/0nVWPZPdPQ9k=; b=Q/0vK7mda58L9rCaZiemnuT+S0aIHs/9Gy437+84
	nJ84HGm6v3yzi7uWYQZ1bPNgfbpYBJBIhNFpfxiJlG0tpthp3LgRMRzktJZzL5AK
	ROgcIUfbDMKD+W4YsLIh2zvOK0arg5L3BbNv5u5Abs8y52+zFpubV2J07rXvnd0o
	fX/tJ7wy8Bx+bfdCrGc9dktB8toXGl4Ji4sjFqCNRlRbIW6219WPxkFQUox/R+D0
	gUYFXvVj5GNx8MPKyPTjFtq7y/W4sOWUmbQlBtldY+Xt5ktx8Cupu++iOtoJsFic
	fTjT3+UgXOOvLk4zbaiXUuvRHuX0Fc07AbqjEOt033SKjQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5y2grmah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c38b85ca2so1954615b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774650671; cv=none;
        d=google.com; s=arc-20240605;
        b=A1BvJho8iblwWJkKu3IGebGKU5wWvrKoBLk0jtkkFZXM4ErKSMK4+Xjv0Q5vkyZfyS
         BO9ORYaS3KOwjNq2+YBmRHdVESqE6Nclt/VEJk7bi2IfWBjX4wYfi6is8UQX7FtYYA4Z
         6Bp3m9IoDDhssWFUdhBsWKjRwW2nKR4CJCwVrRf2HOzHQLHcDogK6BVGRHYOXmiC7AZd
         dzHwxUF0DXWcad6xVUzuPdjeZ5PbtPBk1r8hBW2ls5QHEpbY70HWzCxQuxcopsN3T85S
         l5LKwWPcPeK3Hng5htezhgkZ/qP9EshlBHHSo4EBKjYjV8dpGo1b1KfKhWO5xP4rwcqg
         HJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        fh=DVkXadyqfRmiwsoU5AqrvdqAyiDmK/i11QfyygBBT4I=;
        b=OZoh9gyCIZUrznIuSfdhOaup3XMmBIeH8BjWMPRdwPmcS4tbDfEJereHBRlzoLp9+s
         KurXtcbTcC6ExNLsqxKILPrcxki5tsyEX6/dSXAcMqsjeIG845MSTMpUdBexyxHXb3re
         hxiMSDgM1XiNnx0hiZF7FzMDZv7s7zXuVBZZhj7l23f4Rv2S4VIfH2lm1Fge0Hzn8GtL
         zGkgjj+LymoRbYO622ybCVmUEHONJs7NrBmvby1SYoJJHdh12YGWE7UWtB/1X5lxdOvo
         1SX5IA8JDligOXtdO5G1/79wmEogmsnEl9xO/SlHaz6pK2i3g53lXSg82gU0tNPfjsxw
         amxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774650671; x=1775255471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=KmN5a46we2N37KjJDBnAhup7ENWYaJ/hM4PH16BKqR5XsD0rEaJld7iaSE+GDna9RW
         XHPFrn/qQX5bqTpxsd8d2sTCmjbeDMOiBFkupHMEcYeeeSyB/p3pfagC8OjobcmHgcrL
         K8mWqp5KeV/OQhQ3hBPHlV5DXGYzmX8gddkff+6pbARO8IFIX8F965GdMSeKyrKLDPcu
         yrPSyGmc518A5Qpd/skXZ24iCxczcHdEDXbaID+PJVW556EG0UQSkrBJ0IGUIusn836U
         hFrc0wLJ8EXE0CnjVEFDdVxv+7yE/OfkLcptl6VS6EgcBOMbD73kB7ef9K+i+cpi1P0r
         vH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650671; x=1775255471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=NjHIxYDSN0FDMCzgq2DHh7yYY6xLlWHMwxUAgg52Hul0mxddHWmvtBz+3hJiqXsdLx
         Jm+E21if+O060fAGwPqRPdhoSL20GO7n5kaXbc3v6IHKbEsZT3oitl26I+8PE5wKHQND
         UYVGvCAiQhl6SNcZm8POf15XmaG6dYwlyADvA3wzxBQkPGGPO6guLTOUnk4RAaay4qHP
         4tD9rbNdGczFY9Od42LZf+dhPGQafJ3lifCmFmZDnhdkpEJP7IVFp09QIcC/eNMEuIur
         M++RVjvC46RvqY0BsW3Lx8CvoE2HulX8LF86Nvyml2WcVijXtwGRKCI65v/6ErVrn5Q9
         IdEA==
X-Forwarded-Encrypted: i=1; AJvYcCWOvy4RQ52gvOrITTATtW8Xz8G9+41Pd8arVj+zzWBW0v5C3Xiv0+RH92Jssxqg/Pr2IVfsM+283WVYlURq@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVu8LQQoq0XkyZcrHT789vFB7Dp3sJhHJQKn2q3lRHAbZr9nx
	hZJOzclzSRTu9HDWi7dkse84Qv7aV+xMZzvi5Uuw+ndGen3zCgsupnngQKi830u7cL8fFM84g8p
	tcBy0Jaq6/Ju73LBxFiQKcEb32fsBq+HbEgxOKjF9+N3VsJFCEskfShe3TWkl8JZHUJ4WdwgUJm
	aasHAkdNgfO5Sz++ktDQQynJgMaMEqx9ta42cOMaGq2FM=
X-Gm-Gg: ATEYQzxRp2zOUEzXm2t9usXxRbnHxK03S/Cdc+envJilmo/uje2wWfwOyCVj1rjw+se
	tLqxsDNnRxGMHZSXZBGdsdf5SeovP7V+IZdE14JSfPit6VeK3B16NVy303jGeR9nSz0UADFVEPC
	6h4pH8BCq7p31o+MiwA5EpX/pRgS2WywThBi2XFuqBKSgzt/5ezgI+FlUFmRJbp7P4Pcz0+1BXs
	zFsY4NlW633ogc62bBgKHaZjNZn9t0GrcX+8Bc=
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id d2e1a72fcca58-82c960d66a6mr3844206b3a.58.1774650670373;
        Fri, 27 Mar 2026 15:31:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id
 d2e1a72fcca58-82c960d66a6mr3844167b3a.58.1774650669762; Fri, 27 Mar 2026
 15:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org> <aEe0uBeOge5s3CG521FGdJhY-snL7v7U2KXbg1IAqMn9oy6mslb2GJ9JfYCJ3RRE0L-Qr5opUYFUyBJp3qEraw==@protonmail.internalid>
 <62zcubxembr6iat4d7n3o7aecqtx3ne2a42ilxfoap65oaefhh@mecahghgrwrf> <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
In-Reply-To: <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 00:30:58 +0200
X-Gm-Features: AQROBzBzJ3bpD6jVINfR2GFtsJ4wmBDV3W7m5wN_gCvaCyk9JMJM982w8JUW8hE
Message-ID: <CAO9ioeW2Xi_yQ-bqH0=ST=dx6-1bPjnNEeT29ctdHp039_yeuw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1OCBTYWx0ZWRfX64ZG7uNSi/pS
 pTVByTm+8rRNwG8HKZw1PvjQHBoJc1X5X+uK5HyJ4jRWZmEnjE2SRPrfZDQXAOg/+qxjm+zTI1S
 VvkGJ8y935Xrm375Yb4V/Bc89zennjFo0DSbcRGpalErTmzVbX7MMDsFVKNrLaB/HD/bQWQRw1a
 PXsUyOL/43+/XS/X3vOsOWYspb6DgKsFGdH9Y+k2pR3uRuRTlPKncQgXWdrXAZBMtqWaw+tnO0P
 PNnnwIDbNZ/gzuanttdMI10qR/u/9OnU6t1sRScblQw3NmsgAIhd4CpmKd+jpF1frGp8U0dnJk8
 O0w9iSm5xLjV46wcAzhwgzKK172zd/9mH7yKK5Xj4SpikeknCjw1I5hHmh2grTjJZfYxIHMhGEe
 LD5DzyRf6KD6gsv5WcW4+zmN/YMn+xX80DpEU8L8lbcpVzFt7ZbsvnMKdPi/qBSorEKMonhULRf
 Yh4Gwn+Vmh6g9QX8WCg==
X-Proofpoint-GUID: Xp-ccMbY1XniRAeSHhuwQwMJtl3HzZ3d
X-Authority-Analysis: v=2.4 cv=M7RA6iws c=1 sm=1 tr=0 ts=69c7052f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=M5UCi2xDz22XXY1QiL0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Xp-ccMbY1XniRAeSHhuwQwMJtl3HzZ3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270158
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100485-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 62E3734BFA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 00:11, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 27/03/2026 20:54, Dmitry Baryshkov wrote:
> > I think, I've left similar feedback already. Please rework a single
> > structure-less table into generic and per-lane configuration. It doesn't
> > make sense to repeat the same configuration N times, just with the
> > different offset.
>
> If you remember you also said that was fine for a follow-on series after
> merging, and you asked for a commit log to that effect.
>
> i.e.
>
> "The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop."

Ack.


-- 
With best wishes
Dmitry

