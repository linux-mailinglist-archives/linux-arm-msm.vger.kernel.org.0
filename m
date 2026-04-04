Return-Path: <linux-arm-msm+bounces-101746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAbiCpFV0GkA6gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 02:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A63992D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 02:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49E65300AD97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 00:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067D78C9C;
	Sat,  4 Apr 2026 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8N0QcZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdf0SyQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8851DA23
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261065; cv=pass; b=TE/KhItWJJCe+gPbg9MHZEPnvBZO81aRAHupNZKRKrwG8va8I4lfmgVjNeJPR8heTeZxXejJGscQ7mSQey1ntGIZ4FkRdb8kaRQlCGpxLCAasvoHC8QGE5zF1OAvnzM+MYTxapwtiuxmOhiK0NRL8TCbYq80tcOcfACoou9hg2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261065; c=relaxed/simple;
	bh=bMqGxuMveB8N/Dnc0BM4cz72pAu4ebVe5GE38KXtUWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+/14G0qHMUvTWTW2aSKI5WFDqSmvwlYWmx8K9I2NTJ+5yvbX5Z9G1d381dLdeQplFGLd65iKamTa8YfrdF9nbMUyWKj8iSR2LQ9zpeCsOQDuPRwRH15Vpgi3vUN9CNHCJohkeKhI2HWyb1yuCa5GjcvEifQ+MTQSWoD6gkPmmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8N0QcZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdf0SyQ9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633M0Bka823112
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mVBhn/j5Zs87fQ99Bokk2uut
	cUriWDK6vQARo+vqRZA=; b=C8N0QcZKfCGryNLnc5Kq2sr6nIkkbjtShCuOsa1Q
	94ZkT3IMd9eJxIsU465A23791xIA4BIVlAsDqAkiYS4rJd8ru/oY6k8vP1u9x6w/
	R9gCVYKQlnluvk6WW3rjAVUYjx2xzvHUArKCYpmF7hK5s54yvOqlMM68Q32+FlIi
	ZtPIvKHssH7+8GULrBWjSMNSjKxFvKWlff1piSgHd+tuSPsEib9j62P03yK3WPCW
	/qxFDsp87u8/96OUWNzb5dPjsiFWXvW71LVXso03x4FzhBH2iN2ZHoZFrwfOcqHK
	OIj7B+omz2AfkS9YPwP7xC0MO1c5d8SZR4R+mG5ZIriyhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da673b2ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 00:04:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so16743235ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 17:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775261058; cv=none;
        d=google.com; s=arc-20240605;
        b=btJfIqTvtphn+HdgRQRjYolTdxfo2aRt2WeP1nu7YeeFNS46+XBzsj4e8SamrQK7Aj
         p+lUw3uYQdFim8guoSwnQ44VOY8+M8sVRLdNsteWQGplZMdkfW8pOWvNLWLc0Dw4yF/K
         bdvYgJlXGZ8XlEsg1eXPUpaHeqsiIueRGJScN0iiimh8HmRXnuCJBzrZI8cOsDkxfZ+0
         FgC+MQWHOULy+3FfKfEHgJgg9DVyrVUZ+aExTx7PMCaTpB9Iyxr6K0OubhNP1zKmeshH
         WA5FXVZvvAFZJbvatVRCR8mWE3FFPxt9yxcBOwx7ixDyUiJTHBgXLYIllc/BDnjW2X/2
         45uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        fh=QTPMi+Jzs0S09rPGjRYPo2raCbPMFgDNiPL1K8W7JhM=;
        b=VCHYwy7alTN9jm0DYuGD6u2fy0OTkFG9uim1V2IYPfS+uCLv16UsTHYM8lTYDKVykg
         x9mcSvo1Vy1xmqiwgvxKDKGS3Zf7FUv5TfUbETMFp5twHW6dpF4lwLSL6RuojoxLxJT8
         sOCetPxAInjUpJ7uAc+1LFjhM7TUPjX4VSxhdXdlL2Ev6Z07Y3ob4EzWqFy2rVIL63og
         U92A/QY+oQSfLdVPttIZHzZRXxBiIEInbxviAGjvi4hadvG8zZF4+PdMkXXsANViE2Ok
         MmeC5haykj6CFOiYRPyRBgIYkn9ykOwJRxSmXwLi1oDFKbcHOROkaXXPaEwwpyKCLREI
         WdLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775261058; x=1775865858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=Bdf0SyQ9MCQ7nmJZhdYt0+siCzt6UaXOJle4UzLA2MJlkPabow5/huroo48Q7tvutV
         gx8kjYhoB66+lDH2N0iIeBX/jafFYxpMvtBCxSlze5vKUNa+gX5WdIYos7nLwyDDQDSo
         IiJWb9hH4m8yRFpTijIGyS0seaIYTAaQKi1We0Nq55UeA8DWE77ELr6/hSqsIhKIGDaZ
         tUZbTbMvnENBNfaD59kub/zx/7OWM047kGqjBuyH10FT8c0lMgdIJ2EBjA/nH2v3GpD3
         P8R+cNPmeQbj91wtUBKXBJSrXEjF2DNmVnTKAEcKbsZhE2in8ss/F2KXZ3REy1IxRvNu
         5/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261058; x=1775865858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVBhn/j5Zs87fQ99Bokk2uutcUriWDK6vQARo+vqRZA=;
        b=qGCVfVC6AWkruKkFGbDXN3qdrDmDpNUmUqi8DrJbmD+OQCnk2wcVZ+rEfjZSRRT9uh
         kayHIJizNvsrexB1GteKZ7bn3k5pBXStW0crYNsLFC6TbtV8HPsxZD5Ow+6WIvLiQa90
         g1UK5yS5pDpt5b7QfKEF+jm6F76/8yj5IKLBoj1Mt1Io8uDx/LtAF0VMmDocOZGkzsIJ
         fbPVh/154ndfT7P3mrObxUx7wcUyivB7pwO7+onkqkXfr44fBT6Lj5ajLScM/DTFVaK4
         RmLvFY2uXAR5uNLWSlhwnEx14i76QqjgLcrtFoX9WIx/4G1NPBaH/kb3y3/TY5GwehUw
         0Qww==
X-Forwarded-Encrypted: i=1; AJvYcCVmNlc6LM9xCMSUYkm5nioSunPR6JzMo9i2UNYudezaXD4pYIL+olWXb3zNceiMy3oz8rfaIizexhdBvl/z@vger.kernel.org
X-Gm-Message-State: AOJu0YwosGBjwOhMuymdYs2cyJ1hpMJ24++idwBjh/zPMiM2ebuqENGS
	bpaUPLauUnWe/GG79MAp39v2SWhEi4vC7noJGmMUlfMM8kZYHErrI+WUMKiDN5dnCiyy8Tvkeo6
	kOYfL9zzB3x+5KZaUbWYeG9p5111N/CDjVV17fYQr5JDI57t/LMzcdhhlZbHWLi/NqaOBrG4VWd
	gxvCGzNFyA0PDfd7169jTaPvhkeSGl5GaYinzyaeySTFA=
X-Gm-Gg: AeBDiesjfso5KvN/0W7CfM1SfbaCGxQeySmXrZ5fVwxtWz6sk5rFwHuVeERpp+adOuq
	EpkLCIna9h08Xui2tkarQj2ye2quc9Zh67lyk3QcwVF+Y5aNBB9I/3iJotu+Lntht4YIpHcFKZW
	jBDZgW096YQqC4PQkzjQd3ED4OPVxeKbpe0yyIEz3VC+3AwGBbD/+iWkgvvqwsrGP0r8i32UZt/
	24cfAE=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr72789925ad.14.1775261058093;
        Fri, 03 Apr 2026 17:04:18 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id
 d9443c01a7336-2b277e36491mr72789565ad.14.1775261057567; Fri, 03 Apr 2026
 17:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com> <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
 <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
In-Reply-To: <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 03:04:05 +0300
X-Gm-Features: AQROBzCHfiSEFgykc--8quwVwkz3slXjV5fcPMrhEohl8fqeroSmIXA1wvDwueo
Message-ID: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
Subject: Re: media: iris: enable SM8350 and SC8280XP support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Steev Klimaszewski <threeway@gmail.com>, vikash.garodia@oss.qualcomm.com,
        abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69d05582 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=n3mMJPqUfPv-MVqFI_IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uBU1-8B8aRQCf2PrtB-RlEjewvY7Cn85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIxNiBTYWx0ZWRfXz6YABkYaL0MS
 U6glTt5cP+6TE79tmSUL2Le/TOqeDAy49DOj3LtmVtbf38vhDnFCVU0Amh8mOdq9ndCSPCvUEFb
 lkXKU/fIMHw0XRaNy7o9vKGwYtAq275IRxcbLDcb/G8gPe8+NLcnRvPRbDojlf04gFC8JyR33+P
 q9Rgec21rKrEBkAKjIXSI4qYfGEZYjBgpfSxlLLIGnWSVIa4ncwQZIGk5QBvkhn3vwHwC9uQerH
 cmNDe8PwzHKTZ2dT7/380aq4r4j7WYcWO3HuDOwGFkvDm+bwuvluymLsZbacQEZ/QVnaVJBLPEh
 R0Uwc6b3BuqVoMsYVztynd19fsd75gQJB4mPzrhzfWvAWnr4wl8LK5Ao9h9wYj8vOoazcKsYfhg
 QJgOcmzOfPXHy8VgTNYLjYGV44hUWVxe71fGjO6/jEe0Zq9zJktHX0cLWQs9Pe68tFbmBNjYz0J
 7io/uQ8SoPJZ9sRhoTA==
X-Proofpoint-GUID: uBU1-8B8aRQCf2PrtB-RlEjewvY7Cn85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030216
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101746-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.dev,kernel.org,ixit.cz,vger.kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: EA2A63992D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 4 Apr 2026 at 03:00, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/04/2026 22:59, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> >> Hi Vikash,
> >>
> >>>> This is not just with totem, showtime shows the same issue.  If I let the video
> >>>> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >>>> play*after* the video has played, then I see the smmu fault
> >>>>
> >>>>    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> >>> please log the info about which "iova=0xd51e3e00" buffer is faulting in
> >>> this case
> >> I will include the diff that I applied against my kernel, in case this isn't the
> >> correct information, but I get the following output in EL2:
> >
> > But these logs don't capture, which buffers are causing the IOMMU error.
>
> I'd be interested to see if we can run this test on venus - instead of iris.

At least when I tried testing it, venus wouldn't even boot the
firmware on SC8280XP, citing UC_REGION error:

2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
aa00000.video-codec: non legacy binding
2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
aa00000.video-codec: invalid setting for UC_REGION
2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
aa00000.video-codec: failed to reset venus core
2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
aa00000.video-codec: probe with driver qcom-venus failed with error
-22


>
> Konrad's patches are still floating around somewhere.

I think it was captured by Steev:

> This is much better than the previous venus patchset where accessing the
> hardware decoding would cause the machine to hard reset at least!

-- 
With best wishes
Dmitry

