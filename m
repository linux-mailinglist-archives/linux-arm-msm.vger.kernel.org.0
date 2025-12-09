Return-Path: <linux-arm-msm+bounces-84795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C217CB0FF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 21:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6774D3004F04
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 20:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE11030149F;
	Tue,  9 Dec 2025 20:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIY0eQvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5BHTs5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332132D9ED1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 20:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310809; cv=none; b=YkZJfBoNj2nzSv5yFFBwL/tNwwYF/xfYEvJgaj+0vqsphjNIJlKkqsFUPaLC7VYr75zRKXpJcR5pwCV2Yx35T+I0oZwHcGA2zql1dyS0QPe0rMEovCuXQuuNsGyNzBcgb0f1nsrTpJ/wD61Z++Mg96aEicjREucCxyT+ObCgV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310809; c=relaxed/simple;
	bh=jkFvbS0i/xut0zu744+2sOJHftbH2kksr+Qj1JxmvLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy2Qq4Em5xW5ELsxDHxY38H3TuPM6JreXAlecgTGEdqR5QG4Cz9CmbNzY21vqmswUjaxAcVNbIP6hCTpKvOVmy7bijPS4ReaDxDfiGHOX1zyvmrHdBpy7qG6W5lxzrinnebZPW2EZApTaxNZBf2HuZulnmm/1+YkMXiH7nGtT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIY0eQvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5BHTs5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiSGx055531
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 20:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oyHHD7cOUceGuDr13IzDSjn9
	AkbVvS0IrLOfd/kaby8=; b=TIY0eQvBtF81fSXDqSKQPH9HqL+WvVykmj2GfRzw
	+fv8gSjBup8sDpkAUFj/MbNnXPWNVqmVvZ926ni2uQlr6Gi3v+8FLZj0L4QaM5Yp
	a2+Gm6YX0TXMOEi4yP5KEZyJFGrt856VvR/WbXnZRY2GFCnTHmv/qLef9QJMkJAn
	aADH135K+p+pLUK2uaA0Zf9qo1R+B1ftvUxEtqFo+SqMBTivf+/6uK8lSv2kes2k
	yfxwS/K6J8/7nVa1YrPdYABeSc6znh18POiVCpUA4l2793lyD9kRL5p/4WlM6Lfl
	Gd79RYhVKBkuoC28QUzQ6JTj6qG7D5NnkrD5AL3CwhSv+g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx18she-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:06:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55e67f22715so254710e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 12:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765310806; x=1765915606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyHHD7cOUceGuDr13IzDSjn9AkbVvS0IrLOfd/kaby8=;
        b=Y5BHTs5Ckpl0KF4cTEp1xfNxbBtjDJoxmq3UPXcSCxkp5J+b6cqzBl+G1lClEWf7ku
         Xr0suGN8UzXR0vKMmC2fHKdsKTcwoQf5UKLdnKGxsVoDo40Edofc4zbHR19PgnARko+p
         Wogd+rCTFaeC09mZN83xKDKvK1lsyWNMD5RIP+APxriqVwGZWNvmhSg3H/d5P+Y0++s8
         4awOO6T9mMDT8iE5eChKxDpmYiNjcrAMD39Wdwmx90Gx+3M1/DZ5rktAGOHXxJbhRpb5
         DljsmNyND/09Q74/ABcYVoImM55uC9Qd757jccidlCB2ZnkP3yswCgmfk256FgLl2rsA
         7I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310806; x=1765915606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyHHD7cOUceGuDr13IzDSjn9AkbVvS0IrLOfd/kaby8=;
        b=H92ity8ymKW9/g4VARzGRxCIlZLleQ+ZmeHxEoIeTe2p0K8bajLivaIEyq/OpU4Xfh
         c+6pwSiFrTy/nVFChrP/ETQ3sZ9t1quiFhEWMmxNCxBCmFcDyG2d7fMlJasS8q6Lfr4c
         Bn4BQTu3WEaEvay4oeBkAcNuJOe9JM41u6u4X6+ykwsi7Ytpw9+vq0W2lQdSd67saEYK
         rSzbo/tYRmu0zqHM27FL7PFFuDS3aiP/a0e8lX8LBqHxNg4Jb1V88U/RTbTZ0PFka5+i
         Ycss7BBfzfxIXbAbFRMiOr2f9z5QgLYDRmn/dxs/JmKPS3Ui25aF3KLb7VWvfofimmTv
         shPA==
X-Forwarded-Encrypted: i=1; AJvYcCWB1vGn2EcqwFbLE6fHYqQaLze2isagxq+4dSCLB3WpirD66WmQxcdmXjw44NMK8izHYSATgSDs1UOzBoq7@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDeiCK/MPsFvMxe1uvgmum2Pv7DfciURm5k1f7TnAwvUxdP/d
	SzrxVJD5OjA5Sz1XS7/kJkXXBC462UGVu/3oW0LYZHnJQ/e4HKGbmn7UlsaU2IJnwrC8KK+UCyQ
	fZQsl32dLlnfH4b5LBuTj+XfXnO7OsSYo/vZ/pQtSWoxoiulVihGcAP98CM2pq5G6sXBk
X-Gm-Gg: ASbGnctqk2AdnNVWEMoB6mXfMi/gQLYmmjJImJOuNuYvRd0r01Gv0hBPJxVxRqaYIKS
	YtZEqaY+i/UMRB26Fg9lm65rZC2/VdhMVqgiCQzOZKILPbgSZGMbIqxfGGFLkRUy0gyqNAC0YjD
	V1gJyWUNgxD04i6jdbniemZr61xRP9xBD4fHNzzMtb4l/nx5TDl88c4LDuOoJMxhoUW9svGClBs
	rVC5cQBB2SKtKYyyBrpVhylbFgWfqNNLah3F8Z9OIAFM7TEmf98qKBrgc0+0jUt05e9rwC9cpS3
	yrDcGpsyj8XyQuowg2DLVC/HGJq5K564VlPOB8NA4aaWv6bKKPAMsD7bpPnhnt14n6TuwXpn7oO
	uaYGGCtqI2oEjLMJ/hkKOSlb1YwCHxGhI8IglBTZOHzaqrXuwAOwAScpz+02SLhJdt2K+aD7nMV
	GPW9tHu2Ma3O5UzTa3+cX/R3s=
X-Received: by 2002:a05:6122:5017:b0:55e:82c3:e1f9 with SMTP id 71dfb90a1353d-55fc79f3904mr863570e0c.9.1765310806258;
        Tue, 09 Dec 2025 12:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA+jB0pLN1L3lVdzEOQ0gzhwLzzZ50XXtHAe160mX0/uMOHpW+srl9ZNKt6XXWK+R2llt4VQ==
X-Received: by 2002:a05:6122:5017:b0:55e:82c3:e1f9 with SMTP id 71dfb90a1353d-55fc79f3904mr863539e0c.9.1765310805794;
        Tue, 09 Dec 2025 12:06:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598e9d83ba4sm1036789e87.90.2025.12.09.12.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:06:45 -0800 (PST)
Date: Tue, 9 Dec 2025 22:06:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Message-ID: <hpqk5f57kq7j2zkntzfevvgxhvfxqf6ittqexmwwuuwsuftgbn@4n5dir2jjuve>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-6-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-ipq5018-wifi-v6-6-d0ce2facaa5f@outlook.com>
X-Proofpoint-ORIG-GUID: mhs8Ppxh_DXY97EGh4DPKKOqHUdqfmT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1NCBTYWx0ZWRfXyF4KXFie8Yzo
 N7HfO+eq4akl7uEnfTgfqxE3N7iqvtW8kvMBc7YtYyCzu6em1W4tWByH1Z0vCK6jsqjk0iMRBtx
 ZsVQAxHrjfAemRyWcXpANvsObZY+q0oCOPq5A5LU0v+bz6fwTzainhlLVceeLIpabQvJxN0KFcz
 ZghLpwXwLnJ9+Xy/J4nfTpY6WSWuS0gnWnzpyUQt2bI75vdcazrzwU9Sreiy9baTvfNEuIrHsnR
 0BSdPM4PMBRv5mJlPPtHz7T61vSbhtQ5i4N+nyBAMus1x/0x3xNuLf8I7VEiRJU+dmfIOI5IoUW
 OE13qfzstxuBm9fZlFKy3T9gxma3gEBsi7upuSGBcYFu1D123hnKsq4EcCwDHjvAxkdYh3XR1vr
 52Z5yi8bwRgbSEpD1ROfXgTFrwI4Bw==
X-Proofpoint-GUID: mhs8Ppxh_DXY97EGh4DPKKOqHUdqfmT2
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=69388157 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=osemwfdWNkGZlHKaPu0A:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090154

On Mon, Dec 08, 2025 at 04:25:38PM +0400, George Moussalem via B4 Relay wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> @@ -871,4 +909,28 @@ timer {
>  			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> +
> +	wcss: smp2p-wcss {

Please keep the nodes sorted by name: this node should come before
soc@0 (here and in other DTSI too).

> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs_glb 9>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		smp2p_wcss_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_wcss_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
>  };
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry

