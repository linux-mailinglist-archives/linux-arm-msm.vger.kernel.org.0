Return-Path: <linux-arm-msm+bounces-88105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97ED03928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BDE307AD4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F502DCF7D;
	Thu,  8 Jan 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hElMPaWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OW/sSI38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D12DC32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883557; cv=none; b=sRz6sDqkMxT0d1Slw+d74u9U+JhlLkIuAYSDQa8wuScwckzPWG8QA+mh6xd4urZkSkSWbVqKOxKSKFHhaFp5aXtyWLVC0eb9DkN5h2UnqQnoNr0GYlhIkQywF4Ec/FsOB3hGVbJL/QwD5yJV/iH1UwTxmEj0kl3WVdgBE6I7XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883557; c=relaxed/simple;
	bh=719vA2xl1CTqFcUVUIAPb6+pnCoo6LRc7lrl0UUOYG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnCm3ppCFAPgQIjXeGy+V4u5njDLldlM89PSA7eQWK9yqol7Q0ipRYEHn4Ccq5nav/F4XLmfh1tl+ohVqKhfSICJafIf1G54nhlg8+aG1MwLHXjTz2M0L06q6yJ8aZXqUUhPdui0AOkmAvgc/DrqroHchDCojH3eHmfYNoITJtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hElMPaWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW/sSI38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Bbvip3752175
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 14:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pq2wpHyoeSeo3GqHlkYEI4kR
	dN2xjLc7p2A7VL8bab8=; b=hElMPaWpSDnK8Nl8T293takM/9sTGm+HwaY6o1Jg
	TYLvhwxU0qLR7N21twWwDB9dbQcH0YpCAsnrJ+n/78w3UaaQGh3HzOaCm4Vhwtn9
	+nogCtGxpb38KlvyCqI1k9mKGyBiBkaUKEFkG2RpuY1Oy90HHI/g2r7IVNwz95CX
	lMO1JdmAzquKjonEadUKAT/KIDZ7YYICF/MFpkyLfUPKhASu1oHDYQZzS8vXjIOq
	Lb7QwxQ74NgUZ/oO3Zyroq/mE+0C9EGMRthaURzydqwp+eq7EaeGoRfvNW+DGZ2W
	Tn3SQOz3i1rC+Vz2dv8BoChN3VJQSeaXG9oOWBGokkEqFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcukrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 14:45:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b259f0da04so812820385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767883553; x=1768488353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
        b=OW/sSI38C8taiw3VHukalNEQgfQl9YOnSdFwy3l9R5B76Y0H0RWhYG6SfuKbA6alUG
         En14HqMlImtVjfQgEfwnbXM6P7EXTbjT182ymuCbx6caECkcVsk/EfRtF0rTJ1VuGyml
         gQQSB5rfD5SpKn18WnE0ST7cZuGblLM4E7FhBt6ZG1Y3BzdFq2j4TMOcGBootQswfMUX
         dNrtL9ydPiwGALnGo6xNtclGSOKaqkHku+cNyc7Bdr4EeVWpZeadC6W7X+lK1wVhJzJI
         sIlNsO2mQ7AGjrWP9lPhU6l8D99eA21T0jKplLdI8RH3bst/9Ks2pAlm3FNTzSX0mapY
         1ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883553; x=1768488353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
        b=upS0epNwWaq7d6kKCBlhUgKfDP9eYthIWbYYzRh17SM+ZNVVkPA1UqQtDWslwgLm3X
         wwOQpNyrKMIl7Myz6iyzF+1ZBrffBpEYE90lhl/onpCsikXdS7gg2uXixMBKc3Z/LMTO
         fnFZviEtSd1e7SZGVJGyayGiShp3sorCektLBQbhEc9cSZlwqYYlfhBrFuB1KdQhEX9C
         cTpmKmt4qYgtDC0QMFEgSwYaFnOBQO8+/baLfB0H/TPT+4jGDcpVWG80Qv4Qt1k0OI+g
         R23xZwrNVu1zgXNctROMJsplo83yttsgRhyMcC9hAj5fnYRbjXc8+ViSdcyFZcktMOIH
         q+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrv128mts3ad5R1le1gSFcYspcSloMkLUSo76TQ5mUugEdfwKALpPWXjY6hb170fepMhE7IgLdkVp9oABg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4FGhZbaKFZrmNRjsD1EVV5SInZ14a5c6828YaxYa9WuTLVqp
	Ia1s2D89yKbN2aoWB2D1ZfCkKSu32x7wRO4FsKE2lPhYNN5Rr8XFMjIgL0fhj9fglKtXJmfqmIp
	NS8o5tIpR3FYydi/vLiBAploL9m3vT9Ie//Nln2ZSs+wL+MLybfoWaPZ9zVPRTQwkujfE
X-Gm-Gg: AY/fxX4ouiqzcodqWBd2rk1S7HC5GH6vvr58vULgrDV8U593ZTNF9kMZT6K7Kzh7hXv
	Bn3atjyNjXaTaVWlHXb42qfZae9fn61Uu87VFl9Y2FKDiL24RORU7Lsc897J2gbBEuQPXExzM6G
	kp1yv2IoPP4TzI0qnBia5JPQ7EBKXF6DVhCFzeO2asYYfFMhTgMaugRJnuCrQnDiokBKgssMNw3
	UUAw2T2jGq0MRlgT6hBdOjxS1YBCrCLfrr0Axpu+3iE7FxVMVgQDBkJo0OD11KgkPgPL1uoxVc7
	fhzU2dOeaXfabPz20rm0cK41gG2h6vZGoUXPX2xfLY/gzkp87F2ejBlEwRnmQbMzkYunCpoM60q
	KudrOyAm7A7trDl67Jmb6LkGYv3dngyo3NM6kPKX6rwSNUGyKGqO7bc+pqF43rzq6g6kNg9sE5z
	imgJXvIXxfeSrx/4jZNYxnUmY=
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id af79cd13be357-8c3893ef768mr859427885a.42.1767883553335;
        Thu, 08 Jan 2026 06:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwxcTdCeqYmfFw81rrVjX1o3tZ6HAubMUWOlK6ohdXbyRzc6ZAmRhgkWfEBnW4WJG0MWoThw==
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id af79cd13be357-8c3893ef768mr859422685a.42.1767883552810;
        Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ad930sm16527261fa.28.2026.01.08.06.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Date: Thu, 8 Jan 2026 16:45:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfXz/SVWhKLqoKR
 SkVYrK4zeUOAAYRqcShJzg5rSkg5WsKfdwIx5xNCEH5xVP+Vssq0hz5hfq/AOEV4XKnZpzF/CSc
 SsBqQFo8+yOrM33d3TNzT1I3Hh8ZKxtktshrRmQwq/bwOwyZ/VH3qSQgZb25sJN86BUALvJVVhq
 SZzfZIfVAL1+h/tRQkiXBomg1KJ/nonxGJcQK/yjIapZiN/rYbhVgnYLlPXyQprAmZr8rT/Fj67
 OmmFum5Pxjg7w16Dn7WcyKwAlKkSk8lt1hlTHlOH7tEdabsqMq6R8YEfwOE3G/UHhWBmtScYQOV
 WXc1cOHAXj05kfQQc/azMeeBYX4ro8b9ZIjtx48+oNt5rnpXnLA9JfPMU4wLFojt2OCluK4mfDp
 5l5wXT8BrY68gD5JXPgp1saL+VRWOsEhyqDb1hMx6CWDzCKWXjKn7cxvcp+EL4sSRYiazXpSuYH
 oW73hM2DDdU2viSD/Xg==
X-Proofpoint-ORIG-GUID: SyzomKylgIMhANaBc3gf8sqffQca5v55
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695fc322 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7S24nFsuF8Kv7I6KVrkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SyzomKylgIMhANaBc3gf8sqffQca5v55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080106

On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the correct settings for a given DRAM configuration get
> applied, attempt to retrieve that data from SMEM (which happens to be
> what the BSP kernel does, albeit with through convoluted means of the
> bootloader altering the DT with this data).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ---
> I'm not sure about this approach - perhaps a global variable storing
> the selected config, which would then be non-const would be better?

I'd prefer if const data was const, split HBB to a separate API.


-- 
With best wishes
Dmitry

