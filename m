Return-Path: <linux-arm-msm+bounces-83280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2BC85926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BEA44E5303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD4F13AD05;
	Tue, 25 Nov 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FII+UDTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGX+av7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CCC21ABDC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082220; cv=none; b=DLVnWTJMvoiKBDTO1Cfq08xCRsRnhwtKhJjKjSdrFX5SAP8bB16jixXr4t4JZtOLwENX1SO4NcewB7cCjZGpbWwa2M+uTOxvvaAOejLCXLXTQxWfkuEiBqkm07KxjXd8uJwAtyzGOBQlXeIuKseLHmzQvqgT9fjKUeQ1X0F96T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082220; c=relaxed/simple;
	bh=HuGKZuAa3UD0po035lMl4+O0C0vo7DcQnuQ6wveeH+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njOkZb2I+X7acAfZK33H55nlfHUmOrq803kCdTvWVG20SxXUsRQa++OCPqeGxI6duKdRyEU1U0BUwZ47oRwuls0IMMQ1PVwjkVFwliTl/O9Y3P1ih9fJWEcALZ/rj7N1rQH7v9BZosHJSFef4ybIl1P5a0Nk1EM80PmnsbpOCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FII+UDTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGX+av7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD7j2R3317316
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBjlQMU//RTWAkorh4/ODMcv
	htK3cHYCP7D184dJl64=; b=FII+UDTFnOL+XzmBc2WkRkBqT4Ckn0ahpJef2xGO
	RTXZXUZ3Bbxji8PSpJHya4wLhdryyJq1TPxxm+i0kgpRf9GKkMW94sbFH/UGYwaq
	5TGChqDK4RSAS1k04F0wgqBGnrN0pIAObpNaQtFMXW23kexu0v6rzurXbIJocMxY
	lH76GuL6SBbLvSW1be+3eNu+2GM7s11u8hXRlxNLuj3lEvMwhQjRq5RtvDfXjwDE
	+Y3gu8vD7rLP7cdVuwduscn18GlmtK/z4Zr9mWvT5vacerwvk6i1ojCOIkidKvV/
	UZs/rGCz6JqO0w31oN1MwHL17gBYCwyQYM7og/Ir42ggbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qg90a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:50:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e9b2608dso337465985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764082216; x=1764687016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
        b=KGX+av7ilIZe0QeMaXphkGskvAxjoGv1e9R+paE9mXBJxiXG9KhfQisGANTFcbPEIZ
         9qSOPBlWdv0VnbLam4WTLKSuABRiZRBa+ZDimOFHXMyH2DY/1GW9COYPBBE1ml8qgBHc
         Bj8YlVejgNuTUT/5kM8tQE44y0b7A2iC4r2lYsouBtkrM7xJhPGp1s5sabFoBbabRm3T
         jaVPbieLR35vii2wN5l26siTa4Fs/upozJWjt/7Mhx3QcXGu0OvDni+awjuP2ftFNanY
         52gaqiK6aYa/A5xxZUiav3tQ3fxCGX+4prW2x2Yj3J8lo5lR+yjsU4ZJqKVsy2zEd+3g
         T9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082216; x=1764687016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
        b=gh3+nX9cFjeSdFj8sasNE98iT0oqNy9+LDIlXgOmQqNnD5JZ3e4V8aQf67/8OycyQK
         HfznjhDjhJrK/7uyZoD+L6BUJjafQoH0OIBiEOJjEoSWb2ijm6yv1uITzmkHnNRSrnok
         SQSExXhk2Uw5XOGXFB/daYS5avemsx35Ve2YNJ7GE8x5UVZvcus8O97H2OfI2N9p6AZb
         vWOWxbLU379bv2z2U1YKQDf7TeaZm9CnuyLZWzfx0/1XcbQVbDYMlK9uy/NkW7oDoB1P
         57shDWRHcJcnk19ZHjhzlWcKLIhiqYEsWgcPCXy7b+PwNDwVMSDbCYC8gHAy847crDcm
         a8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUvmULl3NiKKdTVgujU6w855ZYcTDFm4ecYVIsOcqS5Sfw0hzG+Tdq2QrsU0WVWQ2lUyII4lLqP0GPl1M93@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGyswu1Aue6KACELdIa5fJ6Nfz+xfcGA3+a5INNT6Mi4W4zGJ
	Ed2glTZa4kd+qSzhuWm4R+OTb3xGnB6i6Hq3A5f+sngxi3oP80jXChGnQLUkqN0qxQbOyoGcHSC
	0Xz3kudUQrcjij3zXBaSkVY9wCBmAlBoLhjBiwhDGl0thh+sF/C6/AnSiY/D3ziJ+0JP3
X-Gm-Gg: ASbGncvxJ35yKu01lFn2DT0unOYJJYl9sYZYLsCOjcRod5HwiB87D3sk4vpWMHlKTtY
	UwYPmIul9hFf1O/hvjRtWAlphj58jvVdXeWzi926tEPYKsvm8fAY/MuXEOePT3HzBe5jLfDNX+K
	f450BgYDF7hapzG1CSP43aAo1taxE5hYDbTgUqBzRfu+dW2CLP6zykDeN1SKURTSxPu3XkH9QXu
	GByZR7ooJPqPY61k+0vv1qdpzVtuOfoCcSp9I6HVU0IyL4Nut5lcFvda+/sL2nUcsP9M2N9n/MN
	eyiRlVUPJ/EHFsascfNCEe2I537pVyLokJTJCoiOtz6hX6nXtKBtKLmWTObXd6gp6DSc1MhdUit
	9MkS8RM3fxELY10S/O8Jy1pjeHP22QsM14Bc8iwLD1zN9lpeRkT3pusZsFi6XodFB4E+bJA71OB
	6bxvdkX8yHn3t+O3THgqFodew=
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id af79cd13be357-8b4ebdaebedmr371471985a.48.1764082216349;
        Tue, 25 Nov 2025 06:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF29JMf6iwu0/+APrErjc9cNvPpPDSPcFhWuKVWwCI7iWvjXvB2+ZefZmNClkzhF3y4wOuO+A==
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id af79cd13be357-8b4ebdaebedmr371466185a.48.1764082215881;
        Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db81b1dsm5069126e87.23.2025.11.25.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:50:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Message-ID: <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX3JqBZYWGCQ8U
 Nvyi+d7ZS9ju1rZprNM9yiK23sfgtSqr5j+8L/8zA7ToSzVqDB8gzRm2PSlbulHpu1KJ1nf7bvg
 FAiOUgNnI+GYxb+iocKDKmIp5jrnmsVDJavUaqox4dpSpITZeTR6/pXwFz3MEsiGjMJXR+2G6L8
 D6pWzC9FnIQffW4LCLkBD8HMNUSQpq0P4x0s5+zkj/GwN34v1TGUC9oUdkpSwc0A8lXXHWwBY7x
 q6gN/x5GjT3XNCcvNlbR0zqVygrlpjvxQ3k9CP2425B8W8C/OWl5MbIf5KBOZqz4J+ox5LB6Ayj
 tWnxXnvDkqraCCf0maxzuY0r1w/rr0J8VxRQ1dkR3GL2kIY5nUHR0Ys8Gv7URjkkn5jACtFc5D1
 8JARIF5XqRJG1k++PkSPtynxexLLKw==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6925c229 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sllrQoStS4Dg3uhmqGIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8AIhKPuz9NO4f-MO0lDBhyZ_3LmZbZRg
X-Proofpoint-GUID: 8AIhKPuz9NO4f-MO0lDBhyZ_3LmZbZRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123

On Tue, Nov 25, 2025 at 02:47:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please prefix the subject according to the driver customs.

> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)

The patch LGTM.

-- 
With best wishes
Dmitry

