Return-Path: <linux-arm-msm+bounces-95763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKzuHTGuqmluVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:36:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22421EDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 136673069AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C0F29BD9A;
	Fri,  6 Mar 2026 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ID5KbRuv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNIBF20+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072E20B22
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793118; cv=none; b=poELkVfFhKUR6rHnpwvlRh8DVhVQSRgGNVnImUJrU+wByYsJHEeccroQBioA7+QqzW/fAWgkxKsWzFlNlQUYCmna04C2arTThX/uq91aUANzU2CxQIy1iTNVIBVBv29zKdXpRBY7c2QGniiVXxi7GgG63ixHILU2YRHxk0bSq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793118; c=relaxed/simple;
	bh=uTR4/2BKw2dnFBh64MYHRVSt1FcY/0VygD9aHUzgiCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLIFyFCNeoOXX/Cp0Qv1OJU4SMPeSsPU2dqqSnsHeF7IFhLjo6gCRHzQ2k41oUA98czvJSnrV6qAstf0ubQOgx7fxxsK6dSRYIHpXHFR/MkCE+3l4PQc5BTQ0ojMuRdvqerRROq5Uxp7za3AvaR2o2hBiE744CXo+02CgKVl4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ID5KbRuv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNIBF20+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626AUxcR2327507
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 10:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=; b=ID5KbRuvUC1SoizJ
	umuQ0puANJIk5HMtDv7fekJ4BBl2DaXH40Orl6y+Zc0Zt6unBEzS3YDVNPCk0em1
	ZCyb2z11eHx3gM57wK2rbdoQc1hV4VEJI/uibL0Z+ZoeNM1y/Rq2Zu8OdhJfowEO
	qBLW4VB4SM2SXULUEOzaff6DAzMYjDqw8nTjaeibkWWnI65mVKplnQByNEtk3Tio
	X1NSyZEyLHPI8WvoD08QMNerJp1Zh6xwlbIRGY2CdVW99xDgjYu8oa+SFrpkS02X
	slfB5qWOYr86Zf3pS2eo7iOFXo6ZeF3lvtRXRb5UEuAiIEem2guRfQpcXtiCkrmE
	NMcyZA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09tqfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:31:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7396634bb4so3757107a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772793116; x=1773397916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=;
        b=QNIBF20+KDOXLwBF5uk5a5etR8QaS8ZCRtYPQlSQ6aulqmdjjtyIEAkkpYt0A/tH5+
         e4BQCXz2mRyGb5QFNKDokYg3st7NTC/qnVno5L9OO/YuDZKP8yPm4ll5jPoNlgOSUSK3
         EKtR+K03X8+lDHwm93B50rPG8/gGICqXr2t/83eEEVGMoC+RUEg5BvQ2D7Q2AyyRiboY
         hvdwyol8adCtmekm6p4Lo1CsEFX8/3wSrVsm6mmUSXmaCtbny8zkAngWsAJfBoVCP8ZD
         i5JLJUUHQ6+BTiLyOEMx+lBFCBvkCo38V5mL4Q/8NYCi1lSSFND4iigBrBGRPeX1Q1Kz
         QQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793116; x=1773397916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=;
        b=Z+xkxyRnYs/9Hy3PgA95qjMJ7MOuL92gXwruk5Pe4B7Q45pi1jenFpCilqCXY257iq
         ITVYC9RtPFI46w+fLPzXur5b4Wt7v4j608fgG6zp3HOA/ndehuxH5SPZsLJ1FVEqk+/G
         m55dYEqo9TYRNNdCpc0PKMIv5lM1z+6EUxuYt5l74WH+tBXs+NQeDK/5s/FVVX2n++JR
         zOuhvmzH1AEzJKRam+HD1pggBxPc3TLIyW53vWJul5n8CTth1bKRcY1u4DYZHCg0AlBJ
         8kkt4yzVra2pSc0DJty1r7Jyd7Xr6Oiiy1u9Fnn713Oxgw47ZThWgtkSsybSrsnCACeF
         Jzxg==
X-Forwarded-Encrypted: i=1; AJvYcCVmTJhKGCGmRTSfNLDmSXZ/TBHm4osbGk39itfZdssiMX0nn1E7uHQDBXWhto9ShucTayVLkiuVGECx7z5c@vger.kernel.org
X-Gm-Message-State: AOJu0YyxchKOyQbhwW+GkblE4XjrAy1958BD++EBtFbkJa50eu/lxmWN
	xr7GXd9sa7AcP2BXON9x7ae4oB9BuBTxy0DuAy1Le5HuCd182kGEdSk9jgZUq+8MpBu2ikEsyD5
	fzRDJzSvVAw1mpF3nJ0xXGFCr7b696YZovrROs4PJqkoVsx7qN20kqIdhJv325TDOAaBv
X-Gm-Gg: ATEYQzwRMKU1CA0X9+5xL7nsSvQMvB1faVdFQMN7WunyFz8jVwz0dVYsPYgu/TiVrd5
	+PKbgf5Yo/rvOJm2uOlVYZPHAD7cpc56xA/eF8Rp5QLJzAfjsw+cgqq6ZylmlkCAW1HbXuD7TgO
	utqDfu+3cnW3M5C4Cy7r9i5gRYCC6ha5HyQQ0v0FIJcW08KO3nXP8CB8S7zMvDRQv67Y9Pc39yd
	33SieXoH82Dp7pZ9GkaqWC+h6IITlql2p+7UOIHm4YmiaIuTvMRwbkx5rR3lOC7A2cKsoXTr05T
	JpfNhgI/yzOEnxkIdKTK7qCiDzlW2GCo0vJvw1oGUX4S4yASKI89rXlHklW20hSFwYDIysHezjw
	P3HqAyo3F/E/kGHx8/KYEdV0X3Drwzl9YCuwrKAWyrScZ1d9bdozbSQ==
X-Received: by 2002:a05:6a21:2d44:b0:398:4b6a:90cc with SMTP id adf61e73a8af0-398590df8bcmr1886655637.70.1772793115755;
        Fri, 06 Mar 2026 02:31:55 -0800 (PST)
X-Received: by 2002:a05:6a21:2d44:b0:398:4b6a:90cc with SMTP id adf61e73a8af0-398590df8bcmr1886632637.70.1772793115260;
        Fri, 06 Mar 2026 02:31:55 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm1726877b3a.64.2026.03.06.02.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:31:54 -0800 (PST)
Message-ID: <aa97748a-cf72-464c-98f6-11d792551aba@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 16:01:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
 <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
 <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IkdFH0U-4gCHUC1UMnt4t_iAwKUQio1W
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aaad1c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uIgEQj9WjdynuVTCvEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IkdFH0U-4gCHUC1UMnt4t_iAwKUQio1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwMCBTYWx0ZWRfX1/1NKOZ2yiz+
 CinUdmFat9615KCwLqkGREPOh8/IfkQPM6GvrM0vFjWb+0Fzq18/WBzfRZQtlVgRJl1UfRjIFc7
 AMFAaarYynSdlHAWk/lM83jH7stkNNF+9HiVXlPGEEyY0ziraUsyVCrcNb+zVZ304A7iGu9xxEo
 0yyDJwZQHMtuqyFpU1TSQLlRytRxrplcjgSVDSFYihZo+oZVhe7gT2j5f9U1jOTFUGPU5LfhJj5
 D6GDpKPgp5DH/OlwfSR/ytL08pDPoHmkGnYEWmHyV+iW/CjbnZrry/dD6nX72wzo+Tu8T5RNkML
 xl1pPsFXnDTOGHvW/d+gborCKmLiDpep3uVfMLfBGBos8zHp8HYmv5wRQlpHxer9YCS5tnK6XSd
 LvYjKCoF8BErrU3wUWR8jUdUZUxL7pZuxtXX77+sWtaWM195509uK6XTC+MZ0FM5JTQ9j9601n+
 zw5IRuu8a7byDoowZmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060100
X-Rspamd-Queue-Id: CF22421EDA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95763-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 2:48 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 02:26:22PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Some Qcom PCIe controller variants bring the PHY out of test power-down
>>>> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
>>>> towards D3cold and the driver disables PCIe clocks and/or regulators
>>>> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
>>>> partially powered, leading to avoidable power leakage.
>>>>
>>>> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
>>>> power the PHY on. Also, for controller revisions that enable PHY power
>>>> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
>>>> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
>>>>
>>>> This ensures the PHY is put into a defined low-power state prior to
>>>> removing its supplies, preventing leakage when entering D3cold.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>>>>    1 file changed, 27 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>>>>    	u32 val;
>>>>    	int ret;
>>>> -	/* enable PCIe clocks and resets */
>>>> +	/* PHY power ON */
>>> This comment is confusing since we already have phy_power_on() API. What does
>>> really happen in the 'test power down' case?
>> QCOM PCIe controller wrapper has way to force the entire PHY into lowest
>> power
>> state by turning everything off, without this bit being cleared the phy will
>> not be
>> powered on even after phy_power_on(), we can think this as a kind of switch
>> from the controller side to power on phy.
>>
> We never cared to set/clear this bit so far. So I'm assuming that if we simply
> set it during init, it will not do any harm and allow the PHY to fully power
> down itself when phy_power_off() is called?
we are already doing set/clear of this bit, its not newly introduced 
one, I am
updating the  comment  to correctly reflect hw behaviour. PHY power on 
looks little
confusing I will update the commet to "Force PHY out of lowest mode".

- Krishna Chaitanya.
> - Mani
>


