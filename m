Return-Path: <linux-arm-msm+bounces-76036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303FBBDA48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8C83BA44B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825F9223DDD;
	Mon,  6 Oct 2025 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxJ6kvb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18A2222C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745666; cv=none; b=ZpCV8UI0hiXQmWXq8Nlc20WZxkm4dHJFwh7Sbeq01Fd3YODtbLh3/S9E8h+NywExzFedVef6ReVuBNQY2r6q91IpLylneQw3pck6gHG13hex6Yoy1BRRb5YWGRSWWYVjdJ9Uji/GSPhh3j4tMHkIHi2JiwaqN/rxbzkwgX1SKBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745666; c=relaxed/simple;
	bh=3n5diOc/GVX3FAyOURc6tDxBpIvqdKVjmuy4hMw576Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQBw19mTT3v+cuhRKHyZnVN2DMo13C4bWIJue5jGlOQUp73EamQoE0jTYyWslqLKPSMPkRXO0DN6OjhfBXbf8DZSsKWllLzeE8dwbP0kFfkgnqLhQAn/hw7Ec6UJCxUyBMiiWLb3cSbXRscDvWZHNIlL5M1iYOsug7VgrP5Wcl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxJ6kvb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NM3Zj027568
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkk1RkRlbB41L4lHFoSJJ7UG
	9ReoAbhWG7PYzEdfnMA=; b=DxJ6kvb1IMmD7N973bpB2J7zMx9/sc9NyCaUwE5j
	iLdASxs+Fz+zAlJWpkUUwqq/fM4+2JG1FlQ4ij6hnQwbdeOlcOczRZ5Q6piwHB17
	BU4THkDH+lc6yClZbDOq7sy06II2IhTQi8tByQB/FfCenp3XAxMwt9rZ9wt/QvHr
	NCX1tgfEGzZ0MFfmto+c8LlirzLF+kQ0lbe6VrMIgDlFXpdkLJvhbB7sPJwx+Mxp
	tQFhGv8NfPkZjSn6PjjrexXUDjkG8iprQQnY7y4zGSNmeXCOtfowlsb/KQfQ0Ugv
	d3AVkhS5rjoF6gzT/0tDOFmThQSekyPq7jXEC/qyw9g6zQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1kggg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:14:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de801c1446so103907671cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745663; x=1760350463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkk1RkRlbB41L4lHFoSJJ7UG9ReoAbhWG7PYzEdfnMA=;
        b=TVqMNz7ha1tlRW39mkFJtBxcrbuBtBMqPuExABtiOlIuLb+M0mHP3SxvgbQCazJ9vf
         Bk+EhBpy4KOKTacRSXZ/V3vjhp45ic2V0ultyxAAAKM3NA/AyCPJfXxWSj7ScDcko9TH
         B3K1m+SCK2dEEp8bZ3eRfLtUrtH3r4QowB9EtIPUnyxlOJrdKIhfyfHWnwiob8vKMqCQ
         v+ryUh1IAeMCp2b1fAwLUl+r2R90VOYPs7TGivpoKkaO2udP+9bUe9PRW3ebogOSJZcJ
         EC+gYCcJEqhKA+xC0edivZHDjemAKKzPoFVABJz9Pi+PQGkBUZ996Mqfe/VXbJITOztK
         YA3Q==
X-Gm-Message-State: AOJu0Yxy1j9foZBxUdtcuw9ui9doJ9FOSzb6S8rzRdocqCsAL5rMiVEw
	7SZ+kLoKl7dfr6wqpyVVGJqsPD6fMocn9OjUxh5KirIxgBrzaVyb3RiT8U4YIuz277XyYOASgyD
	azb6U+kKA0dAWxAMCAjQrnFxIaj5fPqTg/45cGg9ZUdqEluYkhSm5euH0ZN5kZfw/u8Zc
X-Gm-Gg: ASbGncuGFzDaRZw15KwLVdDYK5lRszltq6GIRG1n3gJixh1J+DacvymeEBhzpzbJHJh
	/Yyg0WFl7TkuETJPxljrR/E1LoDvZVqfj8dxRPudQXLqKKmDGKVlU3mEWS6qIrAmNVSsrlnF7j8
	VWw2OXgyxT5SdYJrpEPHfvGe0oL7taR8i+9kzvG70b7c+XrAgEo6a/28rGJ+ynBk2eU0MYKZ0Tu
	237zDy3g9PZCMYdjUNq4OYEUAkoMW0ceGCSFHHcZY2Xe12qp4/tEZnbD0ilzqaIFRHmoei9FG0T
	T8ZtY4htRVJ5r8hnL9eoleXTg0NYD+UYLg442F7moOe2vK6SjuWIlnuBwc0i4aHpq19Dt53mgMc
	wI17EGbZXO7FzwjtOvKbCOOyjqEna/DR2cc4SAPB+f2T4Gu0oRJqVONnvBg==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id d75a77b69052e-4e576a7bbd5mr115462501cf.31.1759745662784;
        Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2mRS+PCS8yqh6XoTz4k2QRrzCDf3fx5rt58x+S+tnSIyPuPPK5UjHLpMhBU2vR1wjv9UXMQ==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id d75a77b69052e-4e576a7bbd5mr115462101cf.31.1759745662272;
        Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e4a5sm4890540e87.93.2025.10.06.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:14:21 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:14:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-7-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: T4dZafJTYFy871lpP-Ga0dWY1z-GGaPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX7EeiBWFtXM+s
 GXLlaXZ62drjBisCJC/OF37BsiUDH/yqOwqIQE/yxO7uxd2rKAFvHT318Vc1GcyoPZzi0W0qFWl
 ZnqlYX8y0WHXkYbEji3QQLS+vmKJa4+HpIQc7AS9UBGXR3s9kgbrcQxjc6c+Ij5xvaFfJHz+qtg
 u4+HhWrftbFgongJQie1c7GBXxBxT/9TFgIJwFxexV+JOA0cO8D9wo2f6+wlY8ieZCrmq05fNwE
 KH8+DkLKFI5dDNxYCKuJKAvtudbOk/B8ia3M01PFoHFdNcynjVeJzx5tbxyzj7We9AXvQ086hMH
 NsDCMAr3LhH2iViLLYOBf6FsvriMPDeTNPQOub8dywJgX6MIx6pCwuVI+GR88icKlkIX0H7EYQ5
 2T7mfnyIaAU2Fvs26ptoBc6tH4/gfQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e39680 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=OIU6w6j0321fZR4p8lUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T4dZafJTYFy871lpP-Ga0dWY1z-GGaPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> +
> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};

Does it really support only a single freq?

> +				};
> +			};
> +

-- 
With best wishes
Dmitry

