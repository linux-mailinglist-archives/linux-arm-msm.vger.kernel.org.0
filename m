Return-Path: <linux-arm-msm+bounces-66838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E1B13A3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD8E3B888C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D952528E1;
	Mon, 28 Jul 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VurnArGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D81B256C61
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753704633; cv=none; b=sUxqYiveqkc11L8q0LCaQTsV3GG1Q6jj/z03m339XtO+bWAKPCQrqjxGZWnSddJTFKgvi4rTbglAibZGDcswXzluBOdQ27igz814gLZ1jZq4wBJBKbgRW0wNug+BiJ2tv/Fm9s7+HiLzZtUQyQjPRKNLZywvlxjr/FWe6Blx/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753704633; c=relaxed/simple;
	bh=SlUHnpJvsu7DOo10LcCPvcjzGwxAC9oLznI7M3JdauE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnuZGvJX4iImaumVCAN2uQo1IIVeLLNBy5rUS2J4RpWcomX01tzAh6CFJ8sb0GTh7W+ItUIVRbdWTeCyL4QTWJdDBiffEklhuoIst3WQElWMuXQ/y+UXbt2zpC3wFObuCnHuDJw+xNSlvoiNjx45i9AqMrpmvKxJlvFBL4GOnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VurnArGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SB5pTI006723
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Z9/0om/fZeIBDRghX6Mf/qX
	8eJ5Ee46TLv/snXtU0Q=; b=VurnArGNvtiGnHtOGpJAv7N2iV6fWhL1M3dc0GBE
	fya0AXHLRNntZvYSqvywohqLg/Y3XHb5NBt6WpswIoaaUyA1oIhyMGQIIhSRH7c5
	I9GHch+Ji0fzgNJ1Mcwke4fWsxMEw6djgrdon35AxZRz697CLF9LPgqGZBPp1Q19
	dAi0vOfKqUbXskUDe8cXyTlCoQRo90X8i9JHF/5wo/cu5vBznJbyf/xPlFZ3i+Jq
	E3+9C2gvgChq5ujJZNN+JDSiQ3QwaBbi4dKFO230OjtfsRFcs2l5yXPa3HYUpWLf
	caKwyFOu0CI+7oqASvBWLrMEczhwnsS/otGB/XaREPqFHQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytvpgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:10:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7074bad051fso10491416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704630; x=1754309430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z9/0om/fZeIBDRghX6Mf/qX8eJ5Ee46TLv/snXtU0Q=;
        b=iQrOsBKv0Uq8d01CKI88kTHkUj6luf4Ti0QaBPf8nFN4ZyI4cBn95tydnSRiM1e4qY
         JYZlo8urxf8jYw2nGUVCMeULDcQS4/944ENwlfyoD6Ycf3GQy1px4fJoqN9fcquIjPVL
         jw715d5pp7Ssg50+w5cUhTt7PWe4kC4pkCtRoXM74Di4UYpylpggk7x0aeGt++GIyyf3
         xWLf2ZG3KWsKZDXiiFKr2/0hMU3Kv11T4UTZdAcf92qwWRgjsNCQJcPzRNmf1C/WU/2d
         zQKpGgTpdITI6pziEL9r40apaES/LDjvMOY9GtnFn7QdiqYMOkskAa0N0KVfkSpJ8gD7
         ew/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq6ol9B7zaS6mTj/DaIy1iLr8oFB8lGL3mMpkf0JMqZFwTp9d+dULtfm4M8SHFE6UuLinFf1c6l47mpTGp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8itIsleo+KC6WiFSatgSG/SJni4h7j2D4TnT2lGCd21UyMqYs
	K2tE0BV5OVc1z5UiCZOq0cKuy90RZII/pbUCu92Xwr0bJN0eskY9TZOFjmGR70exLYlJCd/xC2n
	pLV2aRnE5pGLEY251v/T7DDBLZTyP2wkBB92Q0AiPyWNbyO1+xljMUOZvr5tNeGYaROy8
X-Gm-Gg: ASbGncvCh2vJ6/mDSe7SQuXGGfX+kbP6ygvxq/HqhInPFoqPVh/2eIdqcAUFsz8L/bH
	fLJL4g5u7y4LZ04lwleM6ICh1JDgw8pDsTrP14JsAvXzZqKQV4HcHCKIyxO90oAnWeDtDNDjTDp
	ilQfb4fGvaKQraueyhsOEEwc+0MtONrbKPW4DB2Sl/GA75MVdDCAHrwvEFgUJribwFjbhvB1bYy
	E8UgEYPe0NotSepJguklvCShwcx01qL4QIPauJ3yer2z8tITUXzle/S/OMj/cZ2b/5ODlrJY6le
	RwmgYM7P65BCMODqrXUUdhCHBkrsJkVQprk8MXDVXz7ysBfO9ijqvhrjQdDZoVUbrpu7Md08IvY
	NYghBbQCGarpvs6fb4P9FNcoAh8AzeJ7Oc4qmRMngRS72nKLsz2tG
X-Received: by 2002:ad4:5d47:0:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-707205aeb62mr185599236d6.31.1753704629747;
        Mon, 28 Jul 2025 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE71UWUEj466c0+xSs4DXPbga6P7ZAhusGRh/Zoa1xQUl8yEBQAQPsUMh54XKc4aG33mUXf9Q==
X-Received: by 2002:ad4:5d47:0:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-707205aeb62mr185598696d6.31.1753704629228;
        Mon, 28 Jul 2025 05:10:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63188014sm1259473e87.66.2025.07.28.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 05:10:28 -0700 (PDT)
Date: Mon, 28 Jul 2025 15:10:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes
Message-ID: <mth4grfyxsgd7sxw3i2uzjmeffpelsntrje2qhm3ru4th2nrit@sgjab6smzxkf>
References: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: yE66eW-T5---Wey80PfN2Bm6QLH7hV4d
X-Proofpoint-ORIG-GUID: yE66eW-T5---Wey80PfN2Bm6QLH7hV4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4OSBTYWx0ZWRfX+fppBDTiW+rm
 r7T9NgCzCFNsXEASKyvnAPkLF5yZwI9ZpRywzvqwgutUCs4mNLaAFvVqTKWApLi6PK8ExVns3Lt
 lin+exOb/nuxDjGjlyUILyRmFPzxA22XYBHZfUh9a/nf15LyNtU0V+VZ7gGCpLIRjiNboBiWmrn
 GEgYN99GSlh5cfyZVrN0B0azgswSeX7hs02OyRZslI+r0As2KmI3nqfN8rmykqIy/hQzwKQWYOc
 cZ/KqLaCBeyNpixrtRosd7lGGGiNKOLjV086QrpdhzSbUF55pwqTlU/nzrfj6WfU4mWu6RPOJZI
 sbjkYKticJ4h4U8SCNkbiq5IYN4r3xGb4nMp9qVhcvG1RPCkMb1VMHsCwEsm73iJzBlgpve/2rk
 AkSVPVbcQ6OFeKi74R2dAbKK+/xIeZbaAW13Nm+6c/wd7OZ61/pl4ylJowPEvdPMpNNW39IB
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688768b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=570 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280089

On Mon, Jul 28, 2025 at 11:34:26AM +0200, Loic Poulain wrote:
> The host controller supports HS200/HS400 and HS400 enhanced strobe mode.
> On RB1, this improves Linux eMMC read speed, from ~170MB/s to 300MB/s.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

