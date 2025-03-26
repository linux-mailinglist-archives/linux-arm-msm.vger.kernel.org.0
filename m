Return-Path: <linux-arm-msm+bounces-52544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93343A71BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AC057A8EAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 16:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B901F7580;
	Wed, 26 Mar 2025 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEkpbNGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BF71F5612
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743006261; cv=none; b=YHLuzKD2znwm4Nbw8Kx+z5jYumq1BRec7QB+uM0rNAtHfWwrWrrC7Tjb0pk9eyl3sLxQT4ExOQUuVrnIS/4Qk1dOH+4+UN424cAgv2Mv+7+g+SMFW6sqQ6pPx1GJ38A0d6+Q2pJhHW+goA4DTL3RGy5ifM60DdctyKOLWHmOWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743006261; c=relaxed/simple;
	bh=oZtJTe+Jtze6r/AtQgI7svOWxoBDIpn1QFZpYX+2F8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oigPoi4yy1tow34niX6dJFGE8sIB7KzTM537KNxgjypSQLyWvE+JWJ3tn8jHE+F/yqBUvefq6H1aTINLwuqoA65Jjs+Rmifldnb0K3hvKxnEk2fDF3bRywCkTGFikfSy+Ifw9zT2MVIJ9WC3Tr7Q4tSfRW5NDz+SLq+ZIBR3JPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEkpbNGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEa8U6023577
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 16:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yhQYzgwtR00epObwgs2DNdBy
	0sj30tE1iBd3j+fulDo=; b=QEkpbNGpDe4XxznZGpzE8ZbnHcw8nEVwR/RnWto8
	/X2A2ckt68nuaxtBcZCyZi47BLjRylTdJDZF9gSBJF/MAblYOsv49gIbIMGTTql8
	9uMTrpzQuu/k8jF5Xj8Hh7BRfYhZK3dGWPXqXWyZnGTV6QNP8609IyQurDedCme2
	UW2jSlGbmTEVX6CTGtwCSYe+zSGC86DbNwizCcwyEAr5hGYHcb/4klTIDQjzXFxW
	pUCRVrS04RmUdFg40U92GBA1Qibbl1po7LDUJQWjbcyTojl2SQILAZP3LUaFGx+2
	k5U809H1k8AfYgaBGyyCZgdo2dnBxgq2QOoJHcMPb1A9qQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf2d0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 16:24:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c57f80d258so12232885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 09:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006257; x=1743611057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhQYzgwtR00epObwgs2DNdBy0sj30tE1iBd3j+fulDo=;
        b=NfemgY6tMXahByrQZnPqOMRNp7sbSCSbc9B4j3VdKgJydzF5BqtrIjBLjeb18MtxeQ
         CK9C31C5Nu5RoGUPbQU65GhkVgJh3kvRXWu3zaPdcyRc0ogkVNwrCMAwxIgnGfpxUkyM
         f9NHWCnAUwCMqRjOkc1EMsQpV+8XIPoOClrQtDf4h8YMfuO3G42n/HzuB8OaGbuDEvgy
         gtkeGm6aXYP9htqNjRfBLz1zPgfYC7F8g3fbuoHOVWW5f3phhjTK6fzNY68aD75WxvUT
         KuYn0DM9pqaarKGkYmJYD7r4y/kYso9juLL9++jjQOlp8xQXtff3vco5LZPhW+5lZxR2
         MmSw==
X-Forwarded-Encrypted: i=1; AJvYcCUNqaffwYeE7fBCHndxFifi2SWNWLulAj4QPgcRUnuh098lSZigzmESTk2yGfVXxA5aWQKE01nuYZYegMlW@vger.kernel.org
X-Gm-Message-State: AOJu0YyKT+ctMjpvdn1yDNJtw68N6jB8kdljpB8f/tBcG0DMHf8axgZV
	d3BJStSCJIWZjL0n5DO+PeYqcja8+Sz03wVBaJhzDoU2d7gLMGCc4KWV2usy0hd2yxPNC0AuDnv
	ValfPcr5XE88qsyS6oYrV6tTO61ik+Gkt9s5zyLz8aStQktQIm+OPLwh76qn3bR1s
X-Gm-Gg: ASbGnctFyduTz6DeOcu1JyaRPVDJn4LYJmfABeRXKCZThOx81f4FQuvWUC0PE1QS6zq
	pvBDUF4nj9Dtnv4CGG2NryHIKgf2bPOlrvCWZzDh4l9JeQb18xMkLxQwkgjIK8kmcidAKxYVhzl
	rkNU0oZe/bXbSIJ5tvkQmdFAwx6k7zTxk979qvoI/309eH2QXDG/WI7vLH/5fNiw4WXUI0TvwmC
	wERuA2Obr3wzS7+l33LMYBwhjnuNaqW/pxe29z51aC/WtTixgE6Pu2t7wtQfNFxn+kHr1mWQAmK
	Sh23BCP5iX6sbwBS59DJ/8xdnqNJ64VE3wEzeEhuqBB6cTGL3Q+ixspvuN5FG5pY/Bt569wYTUg
	8U2k=
X-Received: by 2002:a05:620a:4256:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7c5eda64767mr48485785a.41.1743006257366;
        Wed, 26 Mar 2025 09:24:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgncIKgJwh057F7F+azHQ8C62XAJ5G0SimDj0y23CHuroC0rH8G4xWqHGwZWbdX9ZUK2Ir/A==
X-Received: by 2002:a05:620a:4256:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7c5eda64767mr48474585a.41.1743006256181;
        Wed, 26 Mar 2025 09:24:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65082d8sm1882436e87.189.2025.03.26.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:24:14 -0700 (PDT)
Date: Wed, 26 Mar 2025 18:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on
 qcs8300-ride
Message-ID: <kqitrnxonh5sv7gqw3vfdefanmr4wrsoerd2il7enxqw55uskp@eqqnawyfkc4p>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <20250211104421.1172892-2-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211104421.1172892-2-quic_chejiang@quicinc.com>
X-Proofpoint-ORIG-GUID: dlEIxePsWEyJE3TVIxl7ToQcYrwmd0FO
X-Proofpoint-GUID: dlEIxePsWEyJE3TVIxl7ToQcYrwmd0FO
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e42a32 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=ZFGkPW_SGG9sNUVis-cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=869 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260100

On Tue, Feb 11, 2025 at 06:44:21PM +0800, Cheng Jiang wrote:
> Enable BT on qcs8300-ride by adding a node for the BT module. Since the
> platform uses the QCA6698 Bluetooth chip. While the QCA6698 shares th
> same IP core as the WCN6855, it has different RF components and RAM sizes,
> requiring new firmware files. Use the firmware-name property to specify
> the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Just so that it doesn't get lost. It should be rebased on top of WiFi patchset ([1])

[1] https://lore.kernel.org/linux-arm-msm/20250325075331.1662306-1-quic_stonez@quicinc.com/

-- 
With best wishes
Dmitry

