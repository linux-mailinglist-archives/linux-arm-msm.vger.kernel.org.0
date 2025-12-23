Return-Path: <linux-arm-msm+bounces-86419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5DCDA6C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49282301CCC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05F734B438;
	Tue, 23 Dec 2025 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI4dN8ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXCFbFHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C921225409
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519533; cv=none; b=JhOfl+8595Vxf6xjdk5TdnnJwtXYTiYPIU9tt+GkR53jdnfsab0N9o/9P34Yytxes6EwkjCQ+E1xyTXlNkecYfRl2leLUvbuaPwpP+dCizc3s0VsRdSn0qz6D30+DFPI5R/hse0rYohU28OmwEXpMYg+h6xH4SQWkBcO70P+h4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519533; c=relaxed/simple;
	bh=aEYc4AJOLNr0Fq/XaGxyJNzOjvRGBGExsVKICWIWc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbWZ/POuaXEFArI9bX1A4kFrnnF6YJTIFFD83QBNgTkXXMBqt6be0mYvt/FUCnqO/lNaxTnVmluP2lBp/ya0Hxgv1+Y3lFDgrklf3UAL+V2ZROAIeDdYgSojTMuqSTJ0yU5KFkbbl3vcOscKoGANs5aX0CVUXyqpMUFo84SETeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI4dN8ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXCFbFHv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr97q4134186
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6KshIsYTLPDmlTDd0Y/Ja6i6
	zDZQ9rQe0PmWZGrSK0Y=; b=AI4dN8haoMhyfMpAqDD5FmsAm66lEibWh1rOWfsB
	42I19bwfviEDxu16idybD1zIjYzEXOq/CRk2Pfmf0EsEET2M1be7UKOYZUjmUqx8
	1Ve/Z0Mr69cYPiUL3If+GM88+sg8UBNQ9TdN7SBUTGMXpaXRN6Oby9a1YzVb50pf
	Zi2xfpvKIQe1iwezNhrYwPGeFIiQXq7UsARpMKSqSgiFzK9VtU5ZXV6qrSwNCi37
	tUpS4p8Sn1g9clK89Re0BQhfuegCm1FZlliFO3dn1uoiVz5kNSiSHr+FyOooTsV6
	l++I8Gn/2rwb1qHrINcnBVotJOacti/om0GrlV7YaOae3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46rr6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:52:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso80174236d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766519530; x=1767124330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6KshIsYTLPDmlTDd0Y/Ja6i6zDZQ9rQe0PmWZGrSK0Y=;
        b=cXCFbFHvBfy4g9ccDuvmdDhz7fkMG+C7tB4sf5y8g4+QeyvYztiDlk9PvRjJ/tqP92
         ax4pXdg3FzziasyWhxPF5dbynsF2l+jalJbFt0TNulkDzlI9ybhazHspDN0M/VDLT5XC
         BByU/OX65lt4H/DRhuZ73yNkYVhPgSMfBCV1IKWl8tGcEcwF/0weDH+Ru5m2tR5Z1n6B
         UOCMQvlqVdOgvjZdwlmQqoN8GCCwucP45855YdcLZP4qj0YDev+Xiq3PcgSJi6bH+/T3
         UiTwlpVG6kDkBhqqcUNmfWE8O5Q3v4AMzbD/CinluCTbchi4BAaPYA5IFSfsljWynugm
         05yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766519530; x=1767124330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KshIsYTLPDmlTDd0Y/Ja6i6zDZQ9rQe0PmWZGrSK0Y=;
        b=pK5J85nNVqpEM6XWwPn60e9bnbUsBwazEZOgLU/p61ER+U11JyQVMb7U1ky2ppwnGG
         sqh0igHbsrCSeZEVH67nJ736a77Gmnms3nKHuyFHo+3dIQ/H/a3gPzFXqguH/6KA1y6l
         RNcl9riYvkjjwV3QT1gKrl5K63KszyEDv1aQp5XN3yvThTqyb4CGdXziNEjnYk9OF7uP
         aS8Tzp/LdetsB7Z/WsB93Kdo0pf3FJTfzTsw30rE6BtFHyGJKdIevu2w1vslQWmqf6hZ
         CW4yUWjFbGhMV3Ee58nn7rDWXpftBpqw0GIQyNz+/ttunIxqtdDOlFDxx6ARg5nY5KP6
         rPBA==
X-Forwarded-Encrypted: i=1; AJvYcCXNMwKu7Al7HIV3UTif6DlWPTpUj1cPQTSVzIsTqoV8NF3XGhX71wkSdadldYH45iFdb99XoH9T19+mg1/l@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkq1KGpms6Ug7+YTbY0Ye9A4CpWNSqFSG/VwHYxTt7IS4jF6a
	zlfTU+szN/lE6J5UIxEaIRkMqbrPuvvu+mxN2JmU3TxKLp/KTaLlOLIRTQ3pSsI9+HgLK2t8GQt
	/cnqUXMxqzglk8PcId+JIEpc4ZlFa2sUATZx/xgFCi/LZvyr5Be7dBP8GatUS92OcPy1U
X-Gm-Gg: AY/fxX4i4hPkBpHwylI0mga0MczPctbyK5Mba7DY/3ZHH8i/OijI4/crgifNeUTKHJv
	6lawv25PEVKwg+AKNhD1Vh/jihbNqvzVoDLrMUrAn+TU1tUZt782m5I0+1MLP0mAubs5EBO7jUd
	06n+Ovdn9GZHfKyO1hr/3EyVoftprbIG+2zlBhRRieK4NEuKkH3BEcl/EPSatl6IDPaT4Mcxp9A
	0CKAefIFVWkQThxtsMIFwKKxpUXh/Js5JSGBIYndoxmXoUpWN2X4l8fdfonWI5yjTXj6fiRQSb7
	M3YUIknP6nITDboAmtwVlJ1D3tn/bHitODC5TQH2D5zVHMznLe4MYWUmaFz8b5vkCSfS+I1B/bq
	fqyN7UGDWfoTYBmBCBcbAR7chzXMBmNAEnnyCkHwI1I1mSw99xGyNuWTF5DNjNRDccioUEcOhY8
	C/OLGIBambC2Lsqr4cATOAAbY=
X-Received: by 2002:a05:6214:3d87:b0:888:8187:1547 with SMTP id 6a1803df08f44-88d83d66f47mr253092206d6.48.1766519530001;
        Tue, 23 Dec 2025 11:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElcmzSWfMp3OnnkJW3VSNidVbgATVqt44JHPnSvdEiCCLx4xVtfnZ1g49h4JyAKbDBK2UkeQ==
X-Received: by 2002:a05:6214:3d87:b0:888:8187:1547 with SMTP id 6a1803df08f44-88d83d66f47mr253091866d6.48.1766519529517;
        Tue, 23 Dec 2025 11:52:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b307sm35999471fa.31.2025.12.23.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:52:07 -0800 (PST)
Date: Tue, 23 Dec 2025 21:52:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 3/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
Message-ID: <y4ccb5svc3ucrqbqlhsqfau3c3vt5w5eie43w3kk2q2ewksbvd@bzkxunvoerwc>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: V77PbdDgDN1sQHFX0u77dDd0nfDpXifx
X-Proofpoint-GUID: V77PbdDgDN1sQHFX0u77dDd0nfDpXifx
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694af2eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BvWOXjPTdWbiDO9S6QoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2NiBTYWx0ZWRfXwR2D2+QfJ9gB
 P5SRWxu2Q1yyQf+1IkJj/42hEOKnkMiqjFew89dU/JCKQViBSOo5UAWI+igaNtbHXIcKlClBwiX
 Dg/3SS6kB4/+FMrcb7ht7QpjIOsb9wolY6cxqMDmrrGa0gbJBeGv5L50htFG2yPEF6rD2PW3EMo
 oCkIethjk7uBC7X/Ax3dZjzFFaAyf0QJry16tBPGmnCX8B+Uk6VcpVMcZtlB7s4R4UmWzzNG/PK
 FcUEp1+8XU7SKG+vq9/CM8DixE533yii3B7RMbUcivVVD9hUY5qXcAyNRz/LsHPwFTnvcL4ZK5/
 ATH+LcHzB9HFbedzPPHu2SkhfmFuYAyY72MybIGV0FbQmi/nE6pmKExZtCy7KMYku+lz6ZIEp3n
 bsM1rH72wKQ8Nq/roJfgc6sHxkd+6euxoYohOsCbpEETy63F6EKP9P/V7f/2GeuBBdVm8jPWM+Y
 eHc+LpCaBn9BmfbNxpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230166

On Tue, Dec 23, 2025 at 06:02:22PM +0530, Gaurav Kohli wrote:
> The cooling subnode of a remoteproc represents a client of the Thermal
> Mitigation Device QMI service running on it. Each subnode of the cooling
> node represents a single control exposed by the service.
> 
> Add maintainer name also and update this binding for cdsp substem.
> 
> Co-developed-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
>  .../bindings/thermal/qcom,qmi-cooling.yaml    | 99 +++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> 
> +
> +examples:
> +  - |
> +    remoteproc-cdsp {
> +        cooling {
> +            compatible = "qcom,qmi-cooling-cdsp";
> +
> +            cdsp_sw0: cdsp_sw {

After going through the driver and through the DT. How many cooling
handlers can be present on one DSP? If it's always only one, why do we
need subnodes at all?

> +              label = "cdsp_sw";
> +              #cooling-cells = <2>;
> +            };
> +        };
> +    };
> +
> +    remoteproc-cdsp1 {
> +        cooling {
> +            compatible = "qcom,qmi-cooling-cdsp1";
> +
> +            cdsp_sw1: cdsp_sw {
> +              label = "cdsp_sw";
> +              #cooling-cells = <2>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

