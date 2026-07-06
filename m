Return-Path: <linux-arm-msm+bounces-116941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k7sHDabrS2qwcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:53:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C695F714230
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f9FVMwzc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LhNu7Cr4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116941-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116941-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE65304E0C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4B03939CE;
	Mon,  6 Jul 2026 15:46:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE5383306
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:46:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352780; cv=pass; b=UrYyadBSVch7duaMWbtqBB3Yktf3fDSshl1zJ4LUxMpD1G7062Asp9QIn8h7tEPqbYxjT26qpDSHzU4EtwP0ZDFvA7AkWSMUeCF3rkHO0Z5rFaSCLlqe+IGsV1cTxybKMy7UWLnaOhxDLm2iCSAx3D14eBsKZZ0O55lMHV6GnJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352780; c=relaxed/simple;
	bh=xYmENpXmDPnuMk1/CUycyFr+awBe6nSvTWePQTudzMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkUdWklhdl1C3uxh2pq219mYBwyUA6Ob/z0Z/MGvzSiF5udWY18BuOZm5ttbXbJLBaOQJ+YTFLH2oxwIwD1jNelM1o2B93SI7IGR43lah9HYMaCVfBMfEdR4a1ug94vPbNyYOqwQEZOgP0CPDb2OfTtyKFkMYYvUEtxeaET7WOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9FVMwzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhNu7Cr4; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF30i981455
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=; b=f9FVMwzc9wc9WH3J
	3ZYb/ThuiVXqY44vE4KUHg6xeqe81jp91mkfL7mgX9DLHYzUYGYEm4PO7dZz1ilL
	0gvJe60fMiXXNO4lEqDAUO3X0/1HCYNTarknepb1BpqKfC2+wsOYkQh8hs4hNZO1
	iSwca0GRi/JWuZs93mkZ+sYJrp+DhR5Qldt7BVRLz8g96ogI/izOelcEGqTdYkNc
	2vQ1DjSVymWlSg5ubVSwoXIdh1d3i8W5dRLKFB12GwcWR/nJT8GJDETarCTU3igt
	8JMfKnzurbm02wJghc9s+LwdWCpTWBwXbmGuhULrNdBDZchkK2YI2Yy5x33cxPZ1
	ssewjQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsqxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:46:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso40405146d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352778; cv=none;
        d=google.com; s=arc-20260327;
        b=ryFRZf2Rz9lwZVDGlDv7qjB4x+9NFFtq7zHSxAhEUpd5IzhtBY+1XZYITp/rwi6P1N
         15fdxqXaEzlni+EM2WArdgmNXDa7q2ziUla9wlzKWWA6RBNx+2Z5IAMxL45VX+g0sJV5
         OnjlJQrSoZ2xOApcWa61sPaZnA7rlzR9WN6BhUlxNGVkmH9hpjhXgzHVWTH/l1DB0bHj
         psIcF57BhlP7CdoC9KTE+Mf0DrJt5Y7/0IhKTNmb2N2bGcPtsjbQOoh8ddJsqZcTLgoH
         buOWNtBYo9NdNmnHJkP2Mik2OdlPK39LAdzn0eypTSTv1g/CUV1r4X0Le/5O2TqlDmKu
         8yxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        fh=KkPnJwREFXJQ0Jgam8E2tqlbeg3EwOUOQdofDI36s4M=;
        b=Y4QJWO8kfe/5kxFh5GN6HSuoiTpidwGf73uHVs5YYCcnOqyggZtfBi7R0WE1hFndgk
         xozXg+0jlM2vXFTYRrzro7l8nxVjY2yQEQquxSsr0Kz5XyygEVI3BeFPggdwHKYTID/C
         s0rT0zN3YOmlmsVWDpw04PKrMpLMYKMRJmVY+TwtWMCs9ZvodXQ68W64tfqP9/vDkr9k
         2iRQm/QqnW5C0iuYrf4WbI7689bAABYyPzwOOTJGdK1VFQOdZIvMHBsP9tD5glW3t5VT
         FIRadAs6JNyvs1gY31b91c8qLlOhbJtWuv3BQgujT2GrigxQGBWsvrdOnYtgQVnTYVMz
         dQ8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352778; x=1783957578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        b=LhNu7Cr4p2ShLBTQ2WOzXXs+hg+JeiQfmNgAVbATtw8Gps5oYuPomovFRYzlDQ8ppl
         NH4+SixGCF/2IU4OoofUpqkRcOP4MlncjhF541Iyl26xbvJVDATVGBNkExv1B/gSEDgb
         WSRpoAdyuHPiELAJR4nX7KC6RkBOAckBgy4ivCd+Hk+DyUIcpeYZHBA7z/iiQeuClZAO
         S/YSQzstW/WTEYqGOIfwlOwS8XJpHQ0UTHd5VhjACaytIfeyS5HNOhVYfkvm2cg4j2Z+
         7V4HXT7goUIJPjd4jXj6EAZXYy/YONsXh77Q7m/OJ2GuK+jus2tpk/n1TiUffW8UAP+5
         Oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352778; x=1783957578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        b=plvfX3JGAb/fCd8cxN9Uqh89SCKT1mSB5Jk8saiOBpSFeok2acK4XHgBxtMJVOjaPs
         L2O43GbcMaFgkNf009SpRXjC76dS1inCBzoQCwWMPEzUQFQs51lP8qYNUndxkv9Bxnm8
         07s672wnW3A6jZeKXBsaf+FG4CECfKGJM8KuH28l4WKK60jfqEs1mWhixDvB+/l8q+L1
         SrOwN/bg1ehS8SoAyoDOi5IcVLqrRB56nBT03ZJGiheUy+yJsaYF9On80CE7+Ki6NUTk
         lfwqXhHqdH15yfZuoPSKBpwHLkPbgqIgY4GBcQld4fYHogzERp15G+fFWSOlThiCaXoE
         hNbw==
X-Forwarded-Encrypted: i=1; AHgh+RoOdm4mg6D/z401qtTScX7Ie6bolQSBFQtbmAN7T6FsA9URDZqq+Aqggo/UCkwLykjgt6PHdv+DtcFGo9YH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywez/RtM9mCsTNxZFpKdahAl1JZiSqpuEb2UZCBFjk/ZUnP6BAl
	NySoPpwn1kyVXCHeRXAm7zGIh5kuSstI5DCByRe/jUUsn7rCiGO3qorykuurvjJvkmpQP1BJ2nw
	cKT4RAR92tGUgbJedOHK8pmTwHz7sovGnkvGLbFb+Eq7Zq6D0RD1gVI06h5N+LDfMotxatpLxtf
	me9GsV6vTPt+AvURa6n20gXV92z36zimSbFPBBzHBNyy4=
X-Gm-Gg: AfdE7ckNcVb5RmJ0DTp8o9oiWCN0D/N2BtDAkJrMiINiKiFxn2WOTAoai82Ironnwxr
	uyU1vYihMuAXxWS0ZcRViHTtM/ZlwlAA69E8xwMQo6R4dORWJfDRvwwqXBjeabkpkFc+OlLSPSV
	QPRBg1wwS3VcaO3eY8a1xYaD0Jrvhp6i22+F/I/7q0CQuyxJn2GosIvcupwmRhjQVbe70F
X-Received: by 2002:a05:6214:509e:b0:8e9:cd74:87ab with SMTP id 6a1803df08f44-8f5bdffd9e9mr220890786d6.21.1783352777378;
        Mon, 06 Jul 2026 08:46:17 -0700 (PDT)
X-Received: by 2002:a05:6214:509e:b0:8e9:cd74:87ab with SMTP id
 6a1803df08f44-8f5bdffd9e9mr220890016d6.21.1783352776811; Mon, 06 Jul 2026
 08:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com> <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:05 +0200
X-Gm-Features: AVVi8CcMiaMIm1Vvge8nZlP4c_CpSIP7RoUq2vlhL8_0iLB8z8z0FY5gCTSjriA
Message-ID: <CAPx+jO8t_kQ5q4XmNJoJ1nR4Kro-2M1s_Xj93qxuFUW7VPQpTw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: sdhci-msm: add ICE phandle
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ZrSL44NlvXbUKdRFmrG5EWRYgIm3BrxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX2gvG8RxpYCBc
 wpAl3OiDBOlgD3RzG8Bw/Ewv7fPNwAWVWp1ypbbW4sFtOtMNi5A8VYY39iwIO1okOvSeN0XWPRI
 V2aOeCVotp6pvEd3F3a6UM3Rmrfwhe8dtiXQo2nt33h+Wpk7mVwBVEMEx5Wj94AmJjHAbtxAKDg
 8jI95DrD68ZcpTKFdn2rGTaSEu5YFzmSw92M7mOezDnyCssu+dZQqH2EGGC67iMIW3VB2M51a1P
 mVjDy76jst0JBXLj+iOpdeQ2+3nYV/Uj0jsfVtQ4RC7OR+igJ5R2IyY/fbCj8K2FZhOVWGzUaTI
 lnSvpBPQg5Xi+FCimxbhOBSLzi9Psc9VYiXUaUWoo+U5gn9rr0EHb2f9Tc/kUmHnUy/Ls9wqU2K
 TTnrvyW/YCfP70cdeHj3GNHegpwyWiCSADfksN/TEGBUJOMUYX/6YMM3OLpwtWIb3bPb+BXbuG6
 pJJZjZAFsCo41be27hg==
X-Proofpoint-ORIG-GUID: ZrSL44NlvXbUKdRFmrG5EWRYgIm3BrxR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXyG7XMVa1OsmU
 E2lhtdnQ+mCDhYEnnKaKISXAyRLXjDv+Qi3YE7JduRMP9KC8fjTsNGvQQkB2utJlryEgVXH4wGj
 axezq/JH9hb8iFU5sms+bRBJhOWhe7k=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bcdca cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mKE6IO2wa0aNAFb1U8kA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116941-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:abelvesa@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C695F714230

On Mon, Jun 29, 2026 at 9:36=E2=80=AFAM Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> wrote:
>
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>
> On newer Qualcomm SoCs (starting with sc7280/kodiak), ICE is modelled
> as a dedicated DT node. Add the optional qcom,ice phandle to reference
> that node from the SDHCI controller.
>
> When qcom,ice is present, disallow an embedded ICE register region in
> the SDHCI node to avoid double modelling. Older SoCs without qcom,ice
> remain valid.
>
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    | 95 +++++++++++++++-=
------
>  1 file changed, 67 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index bd558a11b792..b3fcc1673c10 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -145,6 +145,11 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: platform specific settings for DLL_CONFIG reg.
>
> +  qcom,ice:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the Inline Crypto Engine (ICE) hardware block for this =
controller.
> +
>    iommus:
>      minItems: 1
>      maxItems: 8
> @@ -198,35 +203,69 @@ allOf:
>              enum:
>                - qcom,sdhci-msm-v4
>      then:
> -      properties:
> -        reg:
> -          minItems: 2
> -          items:
> -            - description: Host controller register map
> -            - description: SD Core register map
> -            - description: CQE register map
> -            - description: Inline Crypto Engine register map
> -        reg-names:
> -          minItems: 2
> -          items:
> -            - const: hc
> -            - const: core
> -            - const: cqhci
> -            - const: ice
> +      if:
> +        required:
> +          - qcom,ice
> +      then:
> +        properties:
> +          reg:
> +            minItems: 2
> +            items:
> +              - description: Host controller register map
> +              - description: SD Core register map
> +              - description: CQE register map
> +          reg-names:
> +            minItems: 2
> +            items:
> +              - const: hc
> +              - const: core
> +              - const: cqhci
> +      else:
> +        properties:
> +          reg:
> +            minItems: 2
> +            items:
> +              - description: Host controller register map
> +              - description: SD Core register map
> +              - description: CQE register map
> +              - description: Inline Crypto Engine register map
> +          reg-names:
> +            minItems: 2
> +            items:
> +              - const: hc
> +              - const: core
> +              - const: cqhci
> +              - const: ice
>      else:
> -      properties:
> -        reg:
> -          minItems: 1
> -          items:
> -            - description: Host controller register map
> -            - description: CQE register map
> -            - description: Inline Crypto Engine register map
> -        reg-names:
> -          minItems: 1
> -          items:
> -            - const: hc
> -            - const: cqhci
> -            - const: ice
> +      if:
> +        required:
> +          - qcom,ice
> +      then:
> +        properties:
> +          reg:
> +            minItems: 1
> +            items:
> +              - description: Host controller register map
> +              - description: CQE register map
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: hc
> +              - const: cqhci
> +      else:
> +        properties:
> +          reg:
> +            minItems: 1
> +            items:
> +              - description: Host controller register map
> +              - description: CQE register map
> +              - description: Inline Crypto Engine register map
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: hc
> +              - const: cqhci
> +              - const: ice
>
>  unevaluatedProperties: false
>
>
> --
> 2.34.1
>

