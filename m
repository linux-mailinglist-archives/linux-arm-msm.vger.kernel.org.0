Return-Path: <linux-arm-msm+bounces-83205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 084ADC83FAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D5123A41DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D172D879F;
	Tue, 25 Nov 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXb7/Qqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUygYNCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECE2D8390
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059299; cv=none; b=Ccz61GxoTqW8smq2vYF3+58tgztQaG2f19MgwYdwcPGWROpmq0QdmpAWJQ+tPaNstxHP9Tlbl6v0XfYr0TvCWAzMINN+cie43XE1pwlcgNYzmPIB+2zT4H6d++sRrBdZlMouQo0XEArpOgCcgwcspT6aFNxSnxebtPqdR2zYVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059299; c=relaxed/simple;
	bh=1ljUoMLs4Xd8HIIH6BvfQHOYw+YCbHBK8EVzVkrolQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0eXXXDZyadIe3A3/lIWpweLY1OdYYXbMXyp86wUHuod340fVO+f5o3eMVfH4XgPo4ob+JvfbvOThagfD4WqTxHqh8KMskvhyz2NKO6JCsp2qPY8VMD9hou+4m0u/K4wulBAmLMHd6WIKYna55kQN02SdBDUa/4cfBbrxNit2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXb7/Qqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUygYNCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP8Di4j2726752
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0xyVDHLDCvMVkzkodB7GPpu
	M+6tZS/+sWy8NjN5kXU=; b=QXb7/QqoTVMFS/a56YPst9Cs45G/ycmOzegR32gb
	rWQa12kmCT6cGrdMZ+kHEMMN4Ap0w7gDfXrOB5gZATXx222rgvg2sMy133gXWaaA
	8Lqk9VXzbhPg7kAlOD6SMt5z5bivlWbPe2aigeZWCwrp1YXVxgCbB8L8F8KcmN6k
	+o3vCaJTJUa4WWG1hxDBY1Ej/v8rl0Wrf2c6E7GN3Xw49MHUqGJqviIOrZ9izXtC
	tJED0oFmECq0TJEzBtZR69XlYpRc1EvhwqcbiiZNiZdaTNAUJ+upBnwH3nion3w4
	daqjSaRuFYIPJcPJRU1v44TeKxqPYQ5CiQEyKC+XeW0+9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvr1mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:28:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89ee646359cso1440970185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 00:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764059296; x=1764664096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
        b=JUygYNCldPvHkaZ/YqUG4pxGdRmLW+hTK1tuRIhvD179ejsI8JQU0l8aEnsobiXNQF
         XgFqgsT8xrwQPVvNIbi0LA7LuhOW1bOl9hBjbcdi1Vl3m6xb/bS2Qp3Hq2oxpsz/xf2N
         RzY2qeLiX0BEo9qbJhpivOthAsq6G8FIk4msTjcCV37ihrsPp7n6Lv9DB5osxmKfKQbY
         7OFYzauom6rW1xYEK+uULLwV1YgGuwOv6VOi+ayzaKGvlRgKSvlK3YcNgPPM9kC2QfxE
         PwwalnzXAGcOdCO7vo5ViIcpOLrWkx9ksDWzwbRJS7Zk8tC2nJ809635eza1vKnn0099
         zz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764059296; x=1764664096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
        b=Fk5aB75lk/yI3bfEr7NJANWh2eoCHu8Qnqbw2sn/YMBrSBghOoFu4XX0YfnTtW+Lwf
         yAzGo4MzeVaq2NmFaSQX6x/++qrSi0daeRtdCvAeemdy4xPAFqJ5Btpwiu4XmuQ/xZed
         d319Adc0oLagNtrro26gkZN8iWtAV6kGVgzqOlDENvwCLLeddzWsbnSTqnPgairQKBPn
         aXd+m3bzooDumyy80OCveABG0/FSMcqSyOzZAKEPV4y/vQmJSIKy3AAaR+n+suQPVWIt
         OeWBV5zQ/GuTAHahoW2vifqHKJGwq9X0cxDRkS4suBeveC64E92ujUcmdfGFLav/Sd++
         RrFw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKflUo9lNmJ7JUpTDOojG8WKUvKOj+hFqndZThdjoUIIgUpuLQ5AOMf3hXRnxP+byWIlrbINRUcnmgO+p@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJLtcNuF2pcth6lL4pnrufEYTUNR9tWEsG5ARx2EpNRJo2s0A
	h2b2PUmG31ish4+dtz/04XnvTlio0SQTemMpstGsw1IMrhCP+c4J7LZ1TL7pkwvjlUfW5jHYnMj
	TJqD2PUaylN+yZaxbj5lQsFASQOonqLu2jwwp8PqgAR6Z4sbn00kqxfS4pK+e1tnGvUjo
X-Gm-Gg: ASbGncsl7k6B5jAH+Wiu2p03DENHB7yZMyIGWmN8gDQYevTJiG2CENRroE8HX+Tmo+i
	09Er2jL0RAf5DK5GrnKevngT9XxLayT3ya5Ql2E5veuIFUxCWVMRmnOccjVCTBTautXMKqvWs3O
	SOecGEpmVKApy3B8PIF5+3YySwn0UAFQ5uvApEs9INqFC3ZEGwkGWBhir0inzbYKPs/SBbfF0Xl
	JogQHGdxu2isq/0QdV8768IwiUYad074CSPcUuY2HOGV3kCSSyUgxjXHOPjLGbx6EYFU7Ko0Xp3
	aJ/TtZrddItcQSuppGjWggnYJiWenjJ1U7uDzlFE2vDdpBbhmz/f2L5ZTA3juemmAEjM867E2Jg
	p0r1aOiDx3WegS3A+jH4sXhx7NYv6ZKTd+ZMrOD1KAduCKPQYRDBqOSCTJa08sjDZPBIghrQYwj
	0=
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id af79cd13be357-8b4ebd6fac3mr250222885a.24.1764059296551;
        Tue, 25 Nov 2025 00:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcN96mL/Mi34nfBciX8M+hnzh6AlZnpTJoX9gJ2nCN4RnvbdoR1QuCweSHuB3nSFJ2g4zXiw==
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id af79cd13be357-8b4ebd6fac3mr250220685a.24.1764059296108;
        Tue, 25 Nov 2025 00:28:16 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295f17dcsm1112575385a.55.2025.11.25.00.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 00:28:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:28:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aSVolV1gkWRK6Slb@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-5-yuanjie.yang@oss.qualcomm.com>
 <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
X-Proofpoint-ORIG-GUID: 3aTsyGF2-nRNRI9aIc276Szmv0HZ0jP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2NyBTYWx0ZWRfX5PLfiGNHDmh7
 qDpgmWfbcYHIdk4umfEAYgHo0yNorFxkEcnkFR/EeTnXF4uX3KTbi26p2BRT2Cu6ET36NnTjHk7
 Z+2swojOQsedntp/rIo59yBFSlvH9k+i1l+YABg7L7kJphniXYyJNysS0U29Tr+e30GnrrDrAqS
 qh0MckrX/OCsEwWmeTBjCMvazwLHkBylZ4211nlbDW/Ia0pOQXB0Ix7K0PJU3MwEdJ7KLgbiW0F
 iNdCWWcvJeWE5unVX9VXcwEoJm6eib8H0bReboM3VzWovkRu4f9oHLJrzX3Iio/Klln2THuZDeh
 zdgl8muirarMg44aRyCOHs+mYh8v+Xzva2iawJzBu3u39TW1/RdCmtAmPUGGdiEh4xp23EAPt5k
 qTGGR4p8BRyPWFKZGA/6Flu4uxlJ6Q==
X-Proofpoint-GUID: 3aTsyGF2-nRNRI9aIc276Szmv0HZ0jP-
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=692568a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Kua_XrAaXZ40T8CRvF8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250067

On Tue, Nov 25, 2025 at 09:17:50AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2025 07:47, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > Kaanapali has significant register changes, making it incompatible
> > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> 
> I don't understand why you have random four quicinc or qualcomm.com
> addresses not related to kernel development, but you did not include
> necessary addresses.
> 
> Please trim your list to only necessary addresses.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
OK, will check all necessary To/Cc entries.

Thanks,
Yuanjie
 
> Best regards,
> Krzysztof

