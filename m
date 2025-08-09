Return-Path: <linux-arm-msm+bounces-68162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F6B1F2E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87291625724
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEB6276022;
	Sat,  9 Aug 2025 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTh+RC49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EB21FF4B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754724946; cv=none; b=Xn6OTpXaW/polSZ74cmIjhvRSDCXFgReD+582dyCyBDEGiFH24SsRjnkJuVbDaR6FmaWRB1bai7i4M5kXOmjgHTea2T3bJWIpHOmPMqoLpKUgL/tOJd2Br0adJQDMJ2RNLxBMJl8Cz+jEY98q0ffyGjvVDLUpXrm1CI7/lqyUug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754724946; c=relaxed/simple;
	bh=E6AUHyZMMF/+zPZS44mF8zqFA4Pv6VLV5G4A7JiW9ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN8Mujp5VimiCauqhZ1iW5MKLK2f4LQx2SVvKHjx463EaUcY1z4OTdChCLjh6MUnDfDzz3T7DYzBfx58d+L90cyi22Hcmf9tismODODPuClFfbR2jTMbCSWbuTzn/9QxhIIoJ5xipDNOhQ0mjAYuwzBQs1BrnMYlDakJ7ZqHNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTh+RC49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794lqpV023612
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=793ppZWsrIij77Y1OuUluZp4
	P0smE2E/QLjBMEM3Awo=; b=ZTh+RC49HHbXdonFVTRS/yBg5wK6je48hIaNoPuW
	qoHu1xemBHvxwbSXjRFBSrPQqWFyfBAiLgRvly0sP7NgrsnL6ZNUK0c2TOp6grOc
	v1ffoKlsvVfrIBeR36UkTPumPQ0IFiWLd3LJzFXrVfSpHvMUsep1L+Li4GnWvy7H
	d9tIza/J5l/ZE1WRNA3cuxf9MTrbxaxWEuv61WCMAe1x81Nv7Q4GUr1ayRUDw6Zm
	9SWsiE8vXoH0gy59mUvZFyhwFYsdhOvUlD5mbsF2UXgHSOxOFgKIEgd0YsWYYZwJ
	P1shnX4tfyJ3LoZyVk8DblEzJgrTkDh9unHQtS9HRjSQ0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9g620-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:35:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7075d48a15bso55782496d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754724943; x=1755329743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=793ppZWsrIij77Y1OuUluZp4P0smE2E/QLjBMEM3Awo=;
        b=wc9qEGp1aM7Dfq2M8J7TxLi7aSXBhF/54omiPLtRLizUX+r2jXHvY4ZjsH+bXXes7V
         KTSi8OJEac0jvCh/4Bu9aHv5fD68KKr1QBoOrXRDUvap1bethfObuHmm0CHcv79sw7z1
         eeJPlkNk2/zuUoNy+HHVGmmyDJrjXFX4y1b2cTnq290kxyuQzH6A8qBy+LtuIs2X7gRj
         4ahW4l/Y/ltwfCeleOl8q91eybdRfpfYuPD9PLJwB98g7+VAkyfkyV1oZVHfWNCp891G
         jgdMip3pNSYfAiZByXwu+wQ3ObaFsbWNsx2GnYWVLM39VMIDvUD9/Y7NpXC4EnSHGByJ
         4XYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHANQmuoOGSrqE3w4ImlJSffLgDIUMcOWWgChBbiyPROwqjkOCQE9WF48NRLY4kgDCj8o0d2nF8oyvXD12@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQ1D+5oXmuotiRGidqycfFth8V8k4UaK8OdRvfDIAlqTecjFU
	8jkzitCa5/sARmOaFucY6hZTUM4CgRRgotUMS4IhJqH+McNlp0A9AgKUtfua8gTYKhhQwIG9nU9
	lmSkHX/AeY+CNj7yP/rhf0t9NWYuV20Jkmh85TcW4dKtsqbkXxflEF4XyiCqIgMn5g6ki
X-Gm-Gg: ASbGncuKtM7ycH+qPPPWJBxSL+TdYmtBRcPLwsCWjqgWbCSPyZSXiVqzdfTOv1kK4iI
	ys+TJMCYyxUf5WyOOG3b37Uj5gisT6etuDnSukj8ZSHVRKuLqMI0ME3KgpZk8SwQEPru/7a4JFL
	BYZWgGDX0K9ibIS0HiDswhM0U0Bn/NEiec0Tkl+lM3n5RHQqfCTPYQ1iJEU/OHhE+81HSf8Weyq
	f8QiA1/ppXdMdZOkvw4Pa5wysxKw9oDJtByj99JWz4fw9GhXjTUKrnpDWi+kt6AplojDmQFwvwg
	smZ2smu0qthV/zros3szR4ouhM8aPO6K78PD4vKLW6jDwn9B4p6Xv4hPDu5W1/r9vLCgPTGlc0H
	UKnSW1IwAC7H8lR6OMhplyWdF+TPyYxrj2X7No2c7cbK1wliIvcTR
X-Received: by 2002:ad4:5aa8:0:b0:707:6977:aa9f with SMTP id 6a1803df08f44-7099a374e7amr75943686d6.36.1754724943144;
        Sat, 09 Aug 2025 00:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+V3FN8kp+AjaeE6KYwRPxZyM6Hct2o3VLDBaJ/JP9bICpHavNGCU00WGCKhqaasJHXQECEQ==
X-Received: by 2002:ad4:5aa8:0:b0:707:6977:aa9f with SMTP id 6a1803df08f44-7099a374e7amr75943476d6.36.1754724942748;
        Sat, 09 Aug 2025 00:35:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9904csm3407575e87.112.2025.08.09.00.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:35:40 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] interconnect: qcom: sa8775p: enable QoS configuration
Message-ID: <sdp4moiiii5zjz7m7ysds3je4h66biuusilc4fx4bq2j4dw7ur@5d3c6gkk6wb7>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808140300.14784-3-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-GUID: atbLa3ko_-gPF9x5yuUoGt5sbhFZbnTw
X-Proofpoint-ORIG-GUID: atbLa3ko_-gPF9x5yuUoGt5sbhFZbnTw
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6896fa50 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=t2WmfeA6w6qF_8Xn0-8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX7auvE+OSNxl8
 L2bBZ3puFsZLpG4eEReaIhdsSeCpXxu6kZxUNm7xDXnrpq3D+K++fvZLcUgvgeZ/dGABC3moC4g
 ZgT9dPyExQ+OJ7/lQX3Bx7Yo2YqEyIcsctdjiikr7I3FrvCnHgA+q+1FSNUAq5Wla2632A7v7FP
 mkO4s3COomINyeOFdt0HtGlpXpBQj2QbQMJBnWdkkyZThMVySogOCH4wk6cxKBx9zBpQRFc9Fkg
 WuqnQhmPqVg2kFx22+7PhoPrR/WT6Z7Tj/ArziqJnpioGWIhsaaYIsXyp3UzD/0mRo0//xWrCVx
 4oYhFKD8N2pNDu8IU5QDSxZkq7C6+DNCCL0AhpMG3IPvt7KQu87r7OQG9zIpTx2pkvWdxWtBuer
 KtdW07wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Fri, Aug 08, 2025 at 07:32:59PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined
> priority and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/sa8775p.c | 439 ++++++++++++++++++++++++++++
>  1 file changed, 439 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/sa8775p.c b/drivers/interconnect/qcom/sa8775p.c
> index 04b4abbf4487..5bf27dbe818d 100644
> --- a/drivers/interconnect/qcom/sa8775p.c
> +++ b/drivers/interconnect/qcom/sa8775p.c
> @@ -213,6 +213,13 @@ static struct qcom_icc_node qxm_qup3 = {
>  	.name = "qxm_qup3",
>  	.channels = 1,
>  	.buswidth = 8,
> +	.qosbox = &(const struct qcom_icc_qosbox) {

Please follow the design on milos / sar2130p / sm8650 and add a separate
struct instance outside of qcom_icc_node.

LGTM otherwise

> +		.num_ports = 1,
> +		.port_offsets = { 0x11000 },
> +		.prio_fwd_disable = 1,
> +		.prio = 2,
> +		.urg_fwd = 0,
> +	},
>  	.num_links = 1,
>  	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
>  };

-- 
With best wishes
Dmitry

