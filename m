Return-Path: <linux-arm-msm+bounces-68966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CDB24821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D4A3A9DA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175D32F6570;
	Wed, 13 Aug 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J28Hi7sg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D62F1FC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083645; cv=none; b=QrT3FDrhZbaFL7EnB3GBh3wbsZaRvuk5uCu9KCyDmSfVUOc0lMnbz2P0zXrAkE7tHQY/jWQPxMtgd1gFH3sHG/G4a42yCPUl7UVW73yrcoSOdPXjh3/E7r62qDodfPyCkpuZbw2ZDId/7s4QChtMJ3G5zuR5yKfwN35aMRiEU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083645; c=relaxed/simple;
	bh=URLN0J3viIGWjUPM9pj9P03nzVRIC7f2xtWJzWviqtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAqZFwWK9tY01n4UAzUGz2xrhfy0l0570yyESrp8f4BkvXF3LXDt/XXJIgdAksI1jiLvCJgAKY5GKSJbmuvoEiuOv14Kah4HGjls/RuoWPmYEnd2V1kwl+O106LMj+HNJZRRJbpt1oofh89Y16W3lu9Jv/g10WF1iOcoYMbAVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J28Hi7sg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mdq4016406
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXB54FjLkG2LqKyo+58XNe64zZqgQ86PWmPICf+KF7c=; b=J28Hi7sgoK9JToLf
	xY4XoQtPbNb3vtEzQ9IUIy+rK8hbvl2wmzZxGB6Mn/Sh+lkv06AOL3ux9yKTpTSg
	or1CyLpAWKm6gSmAXffyU6NIhPEjARfz4Rh/d7qJIJLBegd14Px56Mjhj3xeA9QU
	hFGT07QNF+ds3gjLlsEH3dfwxCgKH3ejUeJ5389lUISDbmts2xw0Jk06lotNTKjb
	wdzjuRJul4LxBe+nVcLSoRE0xDvkTWdIpQdtaQ4AwpjFcKtfsJFz8tS46UDtrNuh
	ycmkcYiU+L12jKFFQ7ihu1q4JV53iXYHP2LfxHI1ei7wt6pnHwQjlGS4xBI3rwhF
	OetkBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbeqt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:14:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso6237991cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 04:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083641; x=1755688441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXB54FjLkG2LqKyo+58XNe64zZqgQ86PWmPICf+KF7c=;
        b=WkIgxdLJEa+cMpBM9lcXpzuw/uUE2xDBymdfeehmb/Gv3nbgSzY61XHxQOO+fPn+0T
         2WWCdXrFE0fwYUmkwodAU+pArk3koL0W6m9vChd5DP+dC1A38Iq8ajn0OhYLPWgI33Xy
         ej9vO08OvRFzE1xMp2mytPtI6EmvjbK4U/NOkrWMKNz3eh3OHgejR8+oRz5odNeN0fA/
         OgjzBq/8jqYSoSI1DTQ2CLCkUQfJEHZzMO8Z0aut1HTqpsGYqKsh6jXh4bO3s4hNwcsU
         UQtKGadUDqhsDC7igpYTyGTWwtuR9qp7IvAcjsFxFSocabPRkqeHixhhAeH1+NHrs7gu
         TAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnw7zQf60/FHNWy9i63z82Mb0YahrDXnnEPPHLXY88b1ASzroVMKn0phz9yx+lpRoQBTpfq44qhaNqh3vJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/JtYfUON4uiXfEaGxtTVqWoz1FziqA4myivXTGPusOEdf6pg
	LbAFol0yq6uC4/5GGTZsggxzjInfXqpjd8C1U+0mufR4tQgKgILdwdCBLia1r2JjVF6yMX2kcnK
	2M/s4tIYEJ2exEqFuF8PvuLYt08aZcK1iwElkToqMsX8xt/jNZEfOOSnnaFtSswsz99cd
X-Gm-Gg: ASbGncv0e6on6K4MV+93EHcrtxSqtwjcuTF0a8Bl/8BfABwK5jn9aqxkMpwvCNdPIno
	GV+4FGJB6Et5yVbTX2JXEHmgA0csg7IRVXxB6weFwF4rHsZ81QlS6VVR2qyi1zrCaDXgX07LWOJ
	2TAIdKG3wHumkWTbJERwKGqkeCv4Q+qYjz9854Lc4YWN7x85wQljSRWFaX33Rpj3nuL477Z46SU
	ff516P7nmjbpsKJyhUMu2LdMhlpXRYsJkrd3MmnS7k92Egy8yFQlgxMJd+v7N8KIX1WIzJaqpmF
	4N2hF9GAxL7cpxWSBivHmuzo8IFL2Q2j+r3dNy0Ay1BHWxyhJTw80DzuDFs0KndvVkPmKZwC0r+
	9XKHlQJNy2yHo8JTe5w==
X-Received: by 2002:a05:622a:46:b0:4b0:af20:f3c0 with SMTP id d75a77b69052e-4b0fc4b6efemr14963391cf.0.1755083641263;
        Wed, 13 Aug 2025 04:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEenB4XKW+CNs2ccR/ZwR4FK59NIDOCXTd1clj8q+3NsTk4JuXQkOVb4eo5aHs+X5qGIf+I7g==
X-Received: by 2002:a05:622a:46:b0:4b0:af20:f3c0 with SMTP id d75a77b69052e-4b0fc4b6efemr14963131cf.0.1755083640704;
        Wed, 13 Aug 2025 04:14:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3981sm2361230366b.35.2025.08.13.04.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:14:00 -0700 (PDT)
Message-ID: <55bad41f-b483-4609-a85a-3f89c49ddfb5@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:13:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] driver: bluetooth: hci_qca: SSR(SubSystem
 Restart)process failed due to tx_idle_timer timeout
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-5-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813033505.3868781-5-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c737a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=FCqFOTUeBOOQReXOLEEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXwYhvr8JiBCtq
 M7wQ/WjPGdggdLBkoXRXOuqcFerah/aU8D6WFE6KSulkzubNDX7O8C0+m3fzrvTTUHCWW3KTlOi
 oZZ66jeoZmplyf6ZLBGpotsw8BrMhiMGO5vuSCAK4yxWf7VhQALuTkZSW9xUzY//y/aNbbEDrAc
 E+h1GDUvOfIT7vQEg1PaxtVzW2014HnnRPwyudBhiZiwckzqcu29YMJt2F8d+w5iYYBK8KsPJZy
 FKwL1zFJ7cp4nWgbfZm2RH8+xi8fYa7Yu+EMeDEyRrc4ugCWnxkZfX4JLze8KllgIoFOh7TaRss
 TNC7jaZ8A0Eel4Xaa3H68tSa0t5Jp/q1vaMrjgb01FoL/dtqNOzgwdujQinjx9Wz8RYDM0wK4Wo
 eP5tkhyt
X-Proofpoint-ORIG-GUID: xkco0ZtrroD3uOAx27QfsNun0l5mgoTg
X-Proofpoint-GUID: xkco0ZtrroD3uOAx27QfsNun0l5mgoTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 8/13/25 5:35 AM, Shuai Zhang wrote:
> When the SSR (SubSystem Restart) duration exceeds 2 seconds, it triggers
> host tx_idle_timeout, which sets host TX state to sleep. due to the

Host? Looks like we're sending a command to the BT chip and that
triggers the issue

> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
> As a result, the controller does not enter sleep mode. Consequently,
> when the host sends a command afterward, it sends 0xFD to the controller,
> but the controller does not respond, leading to a command timeout.
> 
> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 33c2dd7b8..1fb8eea09 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1668,6 +1668,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +		/*
> +		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,

This comment will become out of date quickly, refer to 'tx_idle_delay' instead

Konrad

> +		 * it triggers host tx_idle_timeout, which sets host TX state
> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
> +		 * host enter TX IBS_Sloeep mode.
> +		 */
> +		mod_timer(&qca->tx_idle_timer, jiffies +
> +			  msecs_to_jiffies(qca->tx_idle_delay));
> +
>  		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>  		qca->memdump_state = QCA_MEMDUMP_IDLE;
>  		msleep(50);

