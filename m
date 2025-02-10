Return-Path: <linux-arm-msm+bounces-47478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2465A2F865
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B571C7A253F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3322566F3;
	Mon, 10 Feb 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBt5QMC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2318C18D63E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214961; cv=none; b=O8bIHvm4wIdgfcO1NyctGPjYuTBRxrb4f6l7vq+Ow0WduWraCNlNNmJCFxBA5/cc3GtyqWsQMx1JuNAn4PVAT09tNjt1dwRuuulS6Z9KO+F531M18tOR1dbE10F2z3hRU4t/In/obSum2S9Vw0GN6g1PhgmXY5x+VRtFuk+Etkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214961; c=relaxed/simple;
	bh=I7EP4dIn20KzI1lTsBZnqqe5AzeZJFYSxOlCRE6Fg+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z92MpWuzVIFKSzfx45hSzYt7quD8lWF4/eJeUVwyDSgNfr4U2AEVmGko5XcjBPBO1ZkMsv8lpZw+gwUmbMgXb8U8SgDWDusERpgTcffLm3bASgHTI3v7OnaSMe8AaAVnkQANq7J7dOKISv2BDCRoKWG4k5ah5osD6HJeyh6bpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBt5QMC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AALprc011856
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh0DdHsxr5WFfQNaNYUNbSlgkdYE838NMXB8RSVde18=; b=LBt5QMC+vpSoLesb
	wWYGC62ZNxVGmAlbUe3xin7wIlo4tSzN8uRiugDxfTyjMgMQlJXnzpH5fQshe/P8
	CuBrSL7jBXu9ME3xZzYtnNPBU6NtrsInE6nomwQ34WwImIofLUv7kOljfQ36PEcU
	xUupabKDT1zTbfKKkMhafwi5681Xg0u1jPQ8fuUGEj1USrdiLviMp5Tw5wYmuop2
	7sCGD4wbSm5ZAvgJLKXiN+7X1ZnPk8XFRjqA4cRvZUyToPsyTmY6vXtoZfyij4Ve
	ecZsyoO4SWYW1i2DzL/kGTQHSa9Cx/AgTILeexcWVZRnc9PJzKJpqskEV4LixyIY
	Z4bZzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dync7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:15:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46b3359e6deso13460231cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214957; x=1739819757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh0DdHsxr5WFfQNaNYUNbSlgkdYE838NMXB8RSVde18=;
        b=at6mccAAwJ8sLxdZKRxZDdi4pE9BvklfMkOfo6iUbOnRbvVNe/b5i/ydwCdWwW+96s
         gUaj00v++MA0eT/W1qGrHKTJ+nTl41Dfb7qHb2JxNPviJXkTEwDhn1eD3GGW/KBXruN7
         FUiWblbMNNmZKgjOlAvW/emnxTlbpgqieWK9Zl9ioGwiBoYWNR3dhAjZeBzbtgMzUwSi
         Py6k/ue0y/xTnpOZXll3a8f8PdTrzV7xq9aBDTamTCQ9fOfi9vc4bH5G0EMHuNp5Y6Lr
         hEZwxgwTUyrDVxNk2KBQkwYLku25PlPrUPFfgXODUJxXbPAIOfGfQc3TkGKPwG6Yy90E
         QQAg==
X-Gm-Message-State: AOJu0Yw1H+zC1h5gQKu+sPD8PIywnCiK2Td5VBVsoWPZvfCgG8Ft7oVJ
	nUVnFNP9qtSG/9zpa2FRCgcSxQl9nMS7gIS7Kqm0zozWhGR/c2h/7xpUWQV0yMuBOGkzePzewkZ
	IpT7VToHwaeLqk6kV/Y8eMGkrDlym8yj3BTuxyk1qjqzZiize+oOYi8DzfVjxJ9Y0
X-Gm-Gg: ASbGncundekETZj4r3gOL9Sn7V6isnA7T8fLJwfnYNmLeI9Z0A51/L4lGaXVDlZs4RZ
	ijD9Yz0Sw/0cMRYqcdr9N5cBuMnwrCbDmsIj9Pu03NswHEOCsjHBxGZp5NfjsQC+s5Jl9rsUhLb
	Ll38LaVH+EKrzv+T6xN5+gSlOERLq+DabqHBprlDSGnf1G2x8DaWOksczOuBaI6t86qiSX6rq7o
	B/uTwY5eqL8cxc8QuQsDDPuSIFdk7eTLGNptBSqHbJKMkUUwbIWMDzIy++hfDJWXjsZnWdmS9KV
	gzX3kn96PDTzD9qAJ3Ixepa8J74lPavqyDPy3LAHxhUUcXZjkUTLDl+eqjw=
X-Received: by 2002:ac8:5888:0:b0:467:825e:133b with SMTP id d75a77b69052e-47167b06100mr78390831cf.13.1739214956966;
        Mon, 10 Feb 2025 11:15:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELcVkphzJI1Pe/Lq5r/H1/ISks8CXsMqcrAL+HMp1r0aVvEjTBcEfW3ZYEXqvqpR9D9NBzUQ==
X-Received: by 2002:ac8:5888:0:b0:467:825e:133b with SMTP id d75a77b69052e-47167b06100mr78390561cf.13.1739214956642;
        Mon, 10 Feb 2025 11:15:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4ae412a3sm6910039a12.41.2025.02.10.11.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:15:55 -0800 (PST)
Message-ID: <a3cd632f-7216-4b87-b383-3bf59f25301c@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
To: Cheng Jiang <quic_chejiang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_jiaymao@quicinc.com,
        quic_shuaz@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
References: <20250110063914.28001-1-quic_chejiang@quicinc.com>
 <20250110063914.28001-2-quic_chejiang@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250110063914.28001-2-quic_chejiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mAvRgtS1j535lKTURAYmt7XJ6WEZVm2H
X-Proofpoint-GUID: mAvRgtS1j535lKTURAYmt7XJ6WEZVm2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100155

On 10.01.2025 7:39 AM, Cheng Jiang wrote:
> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
> QCA6698 shares the same IP core as the WCN6855, it has different RF
> components and RAM sizes, requiring new firmware files. Use the
> firmware-name property to specify the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

