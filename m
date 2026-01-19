Return-Path: <linux-arm-msm+bounces-89663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E0D3A909
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53BF33009D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E03735BDA2;
	Mon, 19 Jan 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHpOwIqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pleo2q5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43BF31065B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826169; cv=none; b=dY5ChDF8xoDMucBzp6jwDkb/wD/vC79PRO/u8j/O56cEBR8XD0WX8Sd8HcZnmQi7KHcqz/RBoLGA7z4PqlduOvGpLQ8RW5g1t8DkLy46B5CXgdkvDwUXWGCBM5lHsJHSCVWHrY/c+qeT78mA5DJASTJCkmO4zAxtzUfQUcYR3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826169; c=relaxed/simple;
	bh=c3zQBO7Apbksh9W3mTDEFpCY4StxtVQjdG8EbuFGlyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBhK5WISOcAiy/wfXkKSiJtKhJnNxViGbgFXFzvFaSQDztYEn1FqHIwXBJqsykf8eAelG4Ys2hGyPKAcZ0BY5Hk0AOWuhXuXGzJu/0DNtCUFsVyqDJKh9burBpKdhnBF2NKRwqt6QG3qz0sylBTXuctHYdDcKcnELvKejmElZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHpOwIqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pleo2q5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90kqc227975
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VhQ9FwvnxIg0wpGZTU5qCD1v
	PmdBF3EPcDNMD3vgPxE=; b=XHpOwIqJheGqAm8NOKeKY8j4xkPE1BM5IXdioLf0
	MSKjqINKvpnr6LpJdFp7tZiuKUxEql3d74kreqYj5+KnaguYTjaVjf5v+5sFD39W
	anKH707SQ36fs28Lfozac6BrA8gNbPdqOA/pcuJ9mtTa4Ss+pCq+NFquBUl6rO15
	1jEMIa/u1FMZFw95VgTSSG+1kxTHL+y64qSfOAZjve1x0o8W2m/lGlSP41hMZ7RV
	N0XYi2UjmwEUIZlCahSxBOPc+7E3NEC5ADCcWC+abcsyeNVyAV2c+wu1pjpZ2B3P
	03+DDKKSQlgp53fV9a7L01tn5qqg5HjTiLYnWDIuBqRn1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8xc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:36:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so1080424185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768826165; x=1769430965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
        b=Pleo2q5sHqulZ2rOV+yHEy97jkK5CRpxOG6GnPwrVXrAhe05cj4olVJHXSDpmp4d0/
         KljqvrqL+merKAfGISanR2jtA/uoAXI6eSLtpG3MY9xJ53cAjcNdZpEmvbgBoyaiSJkv
         yGMvIQhWKPRLAW6TrGvkh5UMr9j10TQ5zP2dHdcVveE6BnaWfDlmvO6KDv0X/ooONpJY
         wL4UQo+K8HKtbLTD9+CyHh2ExcGggGGuJwUvdYw1oX9E2+KNrWaKsxaXe++5ASOpwNWd
         gRbmGGBzES/RNQRuNGyGDL+XZJ1U+ZkC6exqtGG6FZKSxYwSHvbRO1nxKJdHKlsdLcHV
         UORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826165; x=1769430965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
        b=R3kaqYrri8xx2RAlfGT07ZNYO45dFEiSMQESX0Khb5f/hqgFUXle979TRtgZSj3F+r
         B+oteapnJW7vzzOD0N1PiPNFEHPKkm9ZlMhXZ6L28IklOgsY0i5+hp2D6TVYvgxFR3G0
         eL6PrH1gb4yQzfackaDH2QEaFTwoo5OB0HH9bg0/ULkZFmGggtnrsawjANl5riWY02KD
         B0odKvVzXuAHzus7mmCqgnPDyRn+9DVStdsxT3oHNLwMUmYolDtGR/uFZ1EqH/xC0ILe
         9PM4lKWoR3Odg8K1dGNWFllYhbgzg22uy1rlCDLRWl7YOysOS6el9tPy+NtBxmMItZHu
         bqXg==
X-Forwarded-Encrypted: i=1; AJvYcCX5nTUWHb/YwJakoxP+N8WF/PYJghsfBNU30+rfbYCRQoYr01Un0LfXSCvgswbaBdinEQzYGvEdDCe0rLPf@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkBsWpul4XPxQSV54lxykU+UIGsl4GM4KcaMccXbOVqOSr57x
	Y9O7cFFw1E7tt6QyW0JsjEb39G7YYr73G0XHR/R95AUNXxFJzB7NYFg7ccIHL7JJPTPe9lAqSy1
	mmZx8J9316VJ7RL1QYa/bZx8kTbe2UE4ympIAc1An+ryHJR9/G50TM/dbFtmwrrA7nNLH
X-Gm-Gg: AY/fxX5gC9m8Xd87pFpOhp7XOYPYUUobrtx494zhaRkAa+A5S7dicSRseq3h0eHDRKI
	YWlfaCUIMoBQWqZ9krNGOwLeTUL0Gbj7FaVo8eT0ygB8pV8TQsESL3nqrUf51HpxO4AdRp7fE84
	a7KuOIU+GYVnxBxna53sQZliqwEDjaiIkXpK0/rpdZ/nuqniTo/2wRN82sIGMgZ/nJ7D6L26Kpp
	91n5+dFBfxdG2r8QzdaBCqs9sZBJv2LyoK+8EX4joKSuQrRex4Hp1wSLb2/fn8PyOZgSOehHwjS
	7Z6ke9zy9nouUtSkgcNj5X35q/o7mHTECWOHpsrB8p0pSRPa0pjmxnfhE8kKBJs/B/OEvGwFJMR
	O+2ewqN6KpUuMQn15r484WKHINANlA+bcrjY5cztynNlA6v5gjlXTRRJLr5UcxAv+x9Z3Binj+3
	zGfr9KPqZzG4iZQ2+aBb3M+CQ=
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8c6a6783edfmr1413786585a.75.1768826164966;
        Mon, 19 Jan 2026 04:36:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8c6a6783edfmr1413782085a.75.1768826164356;
        Mon, 19 Jan 2026 04:36:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf1fdc3bsm3281058e87.0.2026.01.19.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:36:03 -0800 (PST)
Date: Mon, 19 Jan 2026 14:36:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Message-ID: <433cwpqtfzo54ls3ivcahu4fntizgqrdqqi4xgjtbtv3lskpib@dwn7kyshvels>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fZcwPTCOEDuKrZ1bgl9cwDYKs8cqP2-V
X-Proofpoint-GUID: fZcwPTCOEDuKrZ1bgl9cwDYKs8cqP2-V
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e2535 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Zs5HNVOiqO5ZMFY7eAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX7rLeMwan7HTR
 s7SQKfEDmTAMNbmQixc8DwVExe73/6CyYlD6dgX2hO5O6egDOxvVX4FK4YgmFL+ih1y9/wk2Tyd
 t+JzGBlTBQh4/eW64MYUng8zx2lWduBc9cUmoQLgcwEk2i06UsaaeHpjxOLguEQmzfAWiI1eMSM
 CuM/khoH+KefptBTAVo7lTZN+ev+JkDAmY6Do4hmoaRdT9M1DTKgqQq4pWCxSZ06gGvn4xsLHxs
 eoDy6AuO6Rc5g/ZdE+cgfH6h4kvnlf4iKykdXYNKWusqVlurB8nYGC3V4iocnBYo96Ac4/sK+3u
 BzNvJQASADc68gkRhaA3mifgeC/x45SFmQj4cskW5AU+ga8TIruIuXC5qwYGnrm8jegZBItTyPn
 mdphRSZGYJJhPumQ9P8Pb/P57uUiIWwNStp9cObvanTP/fKcV2JWWWyDveUnQAvKWGxXcmGUv7+
 xv+lqP9dzj/EQVj9FVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190104

On Thu, Jan 15, 2026 at 05:27:37PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please rebase on top of https://lore.kernel.org/dri-devel/20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com/

-- 
With best wishes
Dmitry

