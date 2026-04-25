Return-Path: <linux-arm-msm+bounces-104521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EqNmJy637GntbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 14:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E226D46640F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 14:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B45300D31A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4513537F8;
	Sat, 25 Apr 2026 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4mCncOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th4Az1Mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A5BA3D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121067; cv=pass; b=V8i/TIcbVPVFZA//99WAGcUjummrqASj9yFSeFAR0Ypy/lZbuyR0pY1azCQhUpuC0z0FEPfFiDMIMVa4vVB9y92Z0cDuKGX/LRgD4oLZEflzzVfVLP7rkY8aP/Z9a4TmVUUCJNA3bT/XFOTmkySu0X0VHm1J2etDlg5Z1CndBz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121067; c=relaxed/simple;
	bh=KUYDmx7eiabm+HGT1KP+Jx1NJLkN+s6k9yLwElswyYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbiqYCYhTP5Ynd3ZZ/uDKrbkqyaXfNFVm2XUDPFhK27aAinDxDC4LMEbL1eZnFGQl587WJyrdmULFqNEDuaTfD/SDss2Nwnr/JpFUYtT08Yn8bepqe0nOlqJBBNcjuepJh3FJF6yYCpX3m9CCjZoenZIhpy9XfFlvWbHouqvhWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4mCncOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th4Az1Mf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3QqDb470912
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZZY1wpChvcN8rekkpdNoXT8C
	eMSoaSVM3w746nRWCVA=; b=I4mCncObm0sy6AcdduB9Slp4L2ZoqendxruAmIcu
	8zbJLCmD6BDKPsgohFqKklX1A+NLBwehVw062utj07HH9dNtjWPJshlcLWddAUGs
	QYRIoC+Uw7s2QrUUQ9x9sMXNTpXhlrUO9u9SrlrbHAnJQ49TwR+B/hQvvXJ1ouI6
	TvCqNC1z4RvWAyiqeWYrqvZqmhbMm5cn0Zqg5kjwYVF0434+tv9u/XNvuDd2i36r
	58Z41PVth1kBhC1mcflLWEPNDIh9HOuHLpSzZSvHbrjkAXbUsBx2/0zKTiml8Izx
	YjCUAn8AIdhy4emHq2bjwjcv4g8jDaulQDeK0+6oOX2fiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnq5rwrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 12:44:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24af7ca99so116483725ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 05:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777121063; cv=none;
        d=google.com; s=arc-20240605;
        b=gFK5ynrAq/N2KspGvLdeGPGsUREZpeXEKHanqelXgQFJyilzA+MXagPp/mvvq7K+MT
         lcTfJ5kXI3kWk+ZO0q1QQ+Zx1dvTdUeNcOLjiSCGjQn57BA0VPwfTxt4yS9H7V4SrmMn
         fObo2iHAd5Hrp9MtJZ1WZPprlYEJfTTZEfC40EApMKNQ0OAQd17u+7e8c1ybT0aucEwG
         ds1Bfrzenuievpdw90a4R/4W2K4GXrLR7geFEhCOrc7C3iXpfaJ5WLLTzB5FnvZdPlIC
         BjG4pK+WhpPIEAS/WvV/oZ3qtdZ7rwaiEE73DXyX21n/7tXNpLgVND2qZnt75IflORO3
         KAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        fh=ttCD3a1m1EX0l/RZ+aOS5+kve91fauZoufgVgfO/Pto=;
        b=cX0fSRw17VdHlBwDCFituGRAaqTP39tQobw7zXVbryLi0/lLjZczATDl3QKkNIqLCt
         mSpWtFBLhgM0mFpwXxzILAmIEEtnGC2Ld9pOhgFEB1YSYud5vgCrrQWUt3A/LDOe97NF
         ZhTeLfTJC7TBzMsjSXpVJIFrSykqCBrz/ouv+viAMmSU6MPbq6ncnw+tlKViWNyhjp2S
         7s7PdEaxJgZ7qxqzKOmj70uDPZ7oiggDLb2G81Vcundb+U08UNqqSxa2YIh3ZzGGP9fi
         LfNKgsY0VGwA0JlXEzaf3t3vbCPwnytDZZ9NIcZ6c0gkUKmRsS/cwkcgLEboe1kulsS/
         mVcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777121063; x=1777725863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        b=Th4Az1MfvMCPqhQ+4cCzMHu1qQ3lizOqqT/wxzcFkVjyff34CKIYTjbzke4TCHqu9V
         eTguWCoR+cNEFc2KCoVpfSxTP18GNRpBmQeojkVnkhu7l1B8CNU2E7HjN0FQ3qn4C7LU
         wfVImkT6+b/bV36y1EZhfMyL+lkD7UYCAYr/GEww+IkbGaR2ddCy1385bqb+RnbtIJUR
         YF4GLTwxcrLg18SeEcmdOV9/khATK4DZ+MeFxLDsoBl3IPpLhTTl+qQiqMp/xt95h0e/
         RK0WxWXQ/AWSApqielM8oV8G6zv0YsPoA/gU7RXJ2nxA933TfI0Vq27lA8d3r9U8OEK7
         yA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121063; x=1777725863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        b=W5EGo9oPQPyJ1fVuenMzTJZ+SOq8VQXWfs6YdNUMqasqvH01fL0iMvTVRIL+JGpZAi
         KIuBjx1u+T1zGg966b4704dvEC2BS/QMeR0yRAiWouLiTL5mVCZJWEDDIVTqKrdkGSig
         B1sJcXmazrnZkc6xLYozK6hd/KwxfGmp+TRNlAXDUgIjnfbx4PUz7RHBQxHDjYCbOP7r
         lrldzxSUmUHWoQMPIyAhIiEWH0L/vrc0+SEmOOT4ZJ2PKHTCZeiFoVcwm55l13pj3/3o
         i1N+yYCUBlglpOtxBz98u6R0SbwVnz0ofALfZv/ULVClo+guFtr9buy4VH3wNPb/90j8
         F48w==
X-Forwarded-Encrypted: i=1; AFNElJ8lu1WRXHPfDSKoHDC9xEjh/5RBS8MIUMe8rxjEXoVno5r7YJqWqWOKE7ZANkA7aFZ2GBvLJlmglLw0vRky@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ySxxlTm3xgigfNTokhXgrlyggZryBTtwgTJHv2QJp5fyduiB
	arJRZKovWfH6HsUduwL9u8wSL7Ct/j3/SYAS7BeDGZVOd02c0hn9hNY0cKxaQLNLAoASNX9OWrg
	Eys7ICV1P5DZPDyHcfRdN9HJ8z/Lu58icS+tXgMrhObcSBPkj+c5wCrynkx3cKS6OLHwDazu0L2
	awOgvDOLwnyYL0rvgzqfZ88w4EzL5gPA5J1nPVmuVK66s=
X-Gm-Gg: AeBDietBc/UnE/O/84yo4PYDvWZvFu2RQrWMMQMS6u8hHMeoYeBAHdehnPZq9dOxPV7
	8b++0VmN1WuD0bp4iZ+quH5lsExXCHBgbDC3gkHr5osBJrlOPvDiSo3CHSeuHoUU/F6ERkwxx4c
	3ytQqnDkg/UugKQ4yQpTwooAsI61d3LJ3jvJl+0psIgqug1gyIKZ02Tn1sb2hsIQtdpNWVs0S9G
	8Mk9ubdeKTcUnXkAgw=
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3a08d732e29mr38526527637.18.1777121063239;
        Sat, 25 Apr 2026 05:44:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id
 adf61e73a8af0-3a08d732e29mr38526502637.18.1777121062708; Sat, 25 Apr 2026
 05:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:44:10 +0300
X-Gm-Features: AQROBzDbzgzoeQ8icEJ5INzbNAguQUUZZIoTnxFFoW48CUL8wpP5lqdVpk0EGLM
Message-ID: <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QNxYgALL c=1 sm=1 tr=0 ts=69ecb727 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=q-c8-M4KSy-W5MXdCJYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OdMwWsB1Xl_lsX-VAYF6H5MmKbug4Q6D
X-Proofpoint-ORIG-GUID: OdMwWsB1Xl_lsX-VAYF6H5MmKbug4Q6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEyNyBTYWx0ZWRfX+12ajODgs6kt
 8CGFkNBN2m6zHYVbvjeW0gnU+p/srEN/Vh/3FWbRoNwN6E/0xrM3y0/Uw+XT2gdRGlAI9lNhwgy
 ghbuFvnyMjaGY6N1Z3EUpevdcsxlSL2Zf75IymEGpbLkLMk+7sS2zpLxkMtO8nRjYQKthCQBCRt
 7Gv2J2cIhYxersdObjuVzjxVokL9uCH1K94pZM9Kp4O9vSzYMberp+jFVSVvdvq3v67yMfwBPij
 iMq0bA42BH+/2m1zoPxEQp12MNnsyVw7HKYBeH4TdNR5lg51WD66SqOBLS1SyKmCwIhwu7iU9uq
 F8UgXKHJEoVuHxjDnyQv57iZK3U9PeZOy3AHgckxl0cOZImPu5ZxowPBj3TOrz22wlkhENk6T/D
 /2i4nXpKgJtUeMpdWkI2uPNJ2geTuVhNbmpALGcSoIBIzVGZqftIciPlHU0pR8cFwh7pVUfUFIM
 iajUfkndzrF1TvfFSSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250127
X-Rspamd-Queue-Id: E226D46640F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104521-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]

On Sat, 25 Apr 2026 at 15:33, Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
>
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Most likely we need this to be performed for all dispcc drivers. At
least for all laptop usecases.


-- 
With best wishes
Dmitry

