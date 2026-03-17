Return-Path: <linux-arm-msm+bounces-98234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAnqIQKHuWmTJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:53:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 311062AE94D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 640E030379EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C283F23AA;
	Tue, 17 Mar 2026 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPW1207T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4zevFxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C8C3F54BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766374; cv=none; b=NYswpD2ewBetUabBedVdN4NZGPZsCImwQlUTq6YwUrX8BF/ouN32qzxokaXV7IiSm1iQNIpC36YFYHRszuSCTixgesR1cwA6xb0OFIPlB48dBHYDRVDRVZp6EgwNz1DPTim1xkwDkLWgNrXZPCdLt70bREmGm02al8Y2Z+YG6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766374; c=relaxed/simple;
	bh=r2Hw40NGEMTfoadqeBLj/N1ipaflVfm8NH//Hp2YOw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTtxrWad4bF3wKO8/1sLYBBHYvifYqwmt4H7TpscSutkJ8MmiMrQHPhKht9vCkJyy4H3DG49tCXkNoF/DffnqBWe3TeKe5DbOHb6Wd2+fOUffi2gFgzEo/ot7d1SsjF54fSd32sSWYNPNXu2bx/9Uz2I3IthbI2MlObw325Exx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPW1207T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4zevFxT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HE1mFo2905944
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEg5ym3EcEaTOyPG+2ZqhgfUUahdgeNstTiMv0Dd3rg=; b=mPW1207TfUddTigg
	Sbu8/lAYVMayKWH0wclGUgS7WmBBZx/gBBsn4PJNzlzIVG3ycVLgVK7//XokS+1D
	4sMN7X6XkeIpPha84qurr3wY1buixc1YTyQ6jlhietz5roq1bjgZrmja2inangTe
	G3Z5W3Ak28BJYPow6CjOeuFZjon8v28D8JevPUcbu3U22mIjbIBIhiiBcbD6LajQ
	qkxg0BLWCM/dji3j1E8IvNHcy/0nDj+Il2SS1GFOYcC6Xv0ACtGrWe7Y8nd9SjTd
	mFphK58dybTnxVWNeezFVm2678MVLHPpOI1nhcF3CT7Ugsog/CI7bspWJ3QJ/6xd
	A67cyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxj4du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:52:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509118781dcso70219231cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773766371; x=1774371171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEg5ym3EcEaTOyPG+2ZqhgfUUahdgeNstTiMv0Dd3rg=;
        b=R4zevFxTcHm2btrEQtsjCHBMnsRDajvZ8TZVt+K1PJkOpCnuIAAOXUfLtoneqmrhMS
         Qfl8ef6oEchUic/Sd4TD9fSEPP+lOEMi0AMLQOClHhvZsOBDmoMHxllCcqjk3dUq2xXj
         ofRgpy5hHvta2bfSN1Vh2UQ0Ao+McoIdC0vFetIQbJxy7kWxMChlA3jDiVhXkqZAJoTE
         rni00hsdt5hTGKar8EGP3E8g35LysvX9JBxB4Lv4vWjprxA+P0CFF6f6eJNLzTrdNSmR
         wYUAsmnGCwUFw4GtMHbA9S95HykOj2f/XXehRaWs0llr46l1RWTisYKyixKmETWgo4rl
         6eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773766371; x=1774371171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEg5ym3EcEaTOyPG+2ZqhgfUUahdgeNstTiMv0Dd3rg=;
        b=M4RSVuPuBINjOfeMtMtF+f8o6fjgquz+krPEwpgcF1FgiHjWa1lw04vAvAyL1BCic5
         azLd2aHvErf9LzpM3q+OM8Mze7LF0cEehd7Fsbp9wDTyMOOyJO2Yu9R43ggFUudJDwqA
         uPkpZHQMjcYQRp8v9QsoxDHflazmKI5qKa1bvSr1KWxACOMfGRAPet3KCVreGJZ46n/Z
         KLDWmX1dLAJbZYcwaderQ9kKF3zbk0iFeX4NXTYZfWdz8n/nCekoV2jopL3+wo/0hXcB
         ZN6X07S5VYL3nYdXFrIP8zNDNX/3zvNY9bhVkLG3NcEQExSiQW8XaD5ZcUM7hp5QgZkq
         JDgQ==
X-Gm-Message-State: AOJu0YzonFLZMxTx2MWDcyB8NO1og5A9tKmLBfS+6+Ku7zVDW+tiztVq
	Q7Z9s+vR3KuqXCm+Qw6i2VRzG0RYqao7RvZ8WQrlobJkbF9ryHKtXEBhtDZL38YtK3relep9/xB
	xxb3db6wYE69OOFD0UYQJI5XxmeD2sQ1K+CJ3EefNRyRHRM4mHNg5yKonYTCdaviOta/0
X-Gm-Gg: ATEYQzyjdbKMFFWBkJZOol4foiDj/4KRiDWJwisjTV/kWC+Y+uNz4jkFBfk3aP3jV3b
	oKJl2IEilZ7/SZiGNp9NvUbW3cnQ6XHbJKHgd4yK3gOnKMs8Pmc7M/FWAG8lnxKfzm1mR6EXxpi
	8ey2+Dsfjstg4fJHQU1Vi81ZjUOtdXEGC/7JhqehTj0LZoeGeKzMCeNh8APeelkuUY7MLbTmGwi
	5iaiBddGEEFY7RO4OB+smeB2+g1JG4DSrTxi+CFawQF/IZGaQDxNkhF3mXuiP9O24NqhDZn5eM9
	xdzZJLf/ah+29nbu0PTYMkFBEdv1TfBm29yDxa4omN3cAwe3WMPXs8bEirEkH4lZx55l9Hi0nsC
	hnDWJiLpTW4A1HLjZqxj3x/LhqUP/EUWCwu8oOHZlNQo2sLpz+0RA+SgtUS5jmNFVprRVsPPxke
	cgqu4=
X-Received: by 2002:a05:622a:1650:b0:501:46db:6b2b with SMTP id d75a77b69052e-50957e7256dmr203659941cf.9.1773766371104;
        Tue, 17 Mar 2026 09:52:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:501:46db:6b2b with SMTP id d75a77b69052e-50957e7256dmr203659571cf.9.1773766370439;
        Tue, 17 Mar 2026 09:52:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517e0fesm616401fa.14.2026.03.17.09.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:52:49 -0700 (PDT)
Message-ID: <1481817e-6661-48ef-8e1f-707fb168f264@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:52:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] spi: geni-qcom: Check DMA interrupts early in ISR
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wGsowSz2QspPmIw1uwSZA9GAokf812as
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE0OSBTYWx0ZWRfX2QxpXHsY/G0/
 XcsYiyx+hvApu7v5+yX2L3ikt5CkuXIuNARuWHArUkY0rMoG791sPEyaLeTRsweMXMU1HnDzjfk
 jh7b9cEn7FHq4+luzUiL02oLd1Qaxtiv7NMrPf013DAMFwLFRDnCLK6SRmWk1BHh9lpcxTLylJB
 YjO9P5J4m6wWUpnVWpt/GS7rsg1/GwVfTBMmJ4TL0eTcs1lgeP21Xz/TjAnGgca9ks4nFPn1W28
 dDS3CxXVH1WDgDojXZoltjPAQLS7T7A6DlrLKjdDkGgJoY0WGCQ08Vv792Zi+8SJUSnulRZbotI
 ZsDdXN8tFRNW2a8cwavVnZKt5ux2Fw2NcFnFFRJL/Zgl+pf5TBFP3TeK0/mc6xS5f4h2+UyQZs5
 KaNf3InOwWu2ec2Gn201dBkSW7vZlqJ1LGYJK8+TbfnEIUdznxYlZYal2icaetRKdH59S3aKMf7
 YjKE9MWqmedw4c3h8Jg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b986e4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7N2lBykIQV5UtMlc5SIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wGsowSz2QspPmIw1uwSZA9GAokf812as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98234-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 311062AE94D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:19 PM, Praveen Talari wrote:
> The current interrupt handler only checks the GENI main IRQ status
> (m_irq) before deciding to return IRQ_NONE. This can lead to spurious
> IRQ_NONE returns when DMA interrupts are pending but m_irq is zero.
> 
> Move the DMA TX/RX status register reads to the beginning of the ISR,
> right after reading m_irq. Update the early return condition to check
> all three status registers (m_irq, dma_tx_status, dma_rx_status) before
> returning IRQ_NONE.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

