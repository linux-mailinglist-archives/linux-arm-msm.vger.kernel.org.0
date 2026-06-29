Return-Path: <linux-arm-msm+bounces-115120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jb7KGvx5QmqL8AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:58:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A46DBA27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gSymgFTU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UGflzi6T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 594F7302DE76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532D032F76D;
	Mon, 29 Jun 2026 13:56:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB51F5437
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:56:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741390; cv=none; b=QTKUr8FUa5X+olYhZzVrlqlg8qOUamWblP3YRwfIDTE6M3y+sCunnHbT+47g4xMdZLLnEDOXDDAjg8ZnKpeYl/nRy1ybBQLza0QRNst56LAwMQFXQuh4pWYq2RgIfAMyvVN5tXX98HzoXO9GwpQwlRbxf1eLgAE3WxSf2PFQb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741390; c=relaxed/simple;
	bh=zL8AnQy/XAgYIIOv6IcRxAfWemq3VM6dbgmjawO8bBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA9cPwZBEM//1j2g0SiyZbL7ZVw6Y13JsdbEpXoTRT8hU5JxJ8qAH11K+K9eW0asZGlUJB5j8Jy2KgpexNoy9mFHlgC5jWdv11cnpmuCNbXflOJJhY1KboC4GQ7T8VieEm6gaN/536yWo1uxM+B90jTmr6erd9K138WiUzZTmCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSymgFTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGflzi6T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3n22641697
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=; b=gSymgFTUiSa8ObHS
	PKHSjTyI2Ui/xNrxFxtXT9eZeubNA26sdRDTT00qOQOYBhLOghmzpAnsje8HnabZ
	gEVpuIiNJ+9frktuTS19JqtvFbZxvmOLteGuQE7hrzObNraVyMYWaHwULWG4S1+M
	H69Sn+Mf1JVUV/RNlVWK437oqcbr8Pvc8KfQ8ZL4TkAe3iOX9k/mHNhSnNJteoKk
	uZ8+nd9Wvwp81pwPIHnnLlK58XattzsAJ25WlBp3FyIX0hYA9JDdOIaznoL0lGEG
	x61mabU1WaoP+pUiYG6SIKSyXR9BioEKeLAST/r0YxgaTLtsr+3C3o3Ch3h2uHGe
	I+PvpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npes49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:56:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf599c27cso892361cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782741387; x=1783346187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=;
        b=UGflzi6TK5ujYrzoICxYF6vAcaQqQMhEaZ/lf/Tf+2cPdZUt2vuZJ2xT6hfd2Zdlc6
         +dLYbzSYM6py0CwLakF0jb/RD4FagOPeKafZrJSFBZciOHme+dntbdl1rkclq8ub7vVb
         7XhMZY9+40iYnEMzLR+W33qNfn9eNpAxIGiLvealGWiPd7sOhPvW84UUN5xxvR/6rM6j
         EtrTm0XtuRc7i2SEQT5D/Evgcxg/9p+2AVZ3/VR1AzUNA7t+HLd3PabljHCnULAQjaLc
         ibBImvyBBcF/7vXPRGdMpKkk3J2WHeletj2WIaF9Dlc+tHDTkKxP6E40I79hTURgsdmF
         uWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741387; x=1783346187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=;
        b=BaPlFjhUr04GZVVLfwI+F6W+WI17XLCs0g65OPECrBmAa62i/GY7+IIAJve2s1Faab
         CUI/ef2gV5hgBK2lArkP09WzUfXpIT+s+B3jOrrmLk1HWiYPMjiRFitFVeObea1mBHpz
         9MNTxDurA8ZwRiIwDK0IRkW2KdHBcGyZL/fCVgtGI2zJ+TOlyhXeaLr/LdYsPRF/ZgpW
         D/AtHnUwnPBWcuL6ZmLa5RzYV8tCFfCaB7jmtnesBptE22g5FH0yeVW70vjCrdGXZCBL
         OA6fU4rBYv2sqmcSjbi50ojHtuO6pASy87IH0e2ct9DPfF8mUtxxoqPYxi1PHePfoY8O
         qP0A==
X-Gm-Message-State: AOJu0YyUWSfw8IktvC4RwHkI7pORmMFWsID0fhm2J8Ky26amR2PAE2UC
	Rqlgeh7kki3nDlxfAFpOVu2IUDq8/Y2mKFw59WMCTWp+ssBtw0dpCqMdLvyDRXTNnKQt+wHuXFU
	CwODzmgUz2ab7T+iczFYVt6M5Iy49U/eh9cVjACzoMEEfsfF8X4CsPc9eK7PcKnwx+e0y
X-Gm-Gg: AfdE7cm6118yS76OF6ClZzO7kXGEzARKEUI/qExLR7lV/sqhmh2JFxMzQCJu7Cgqgdq
	ob18KC6fvASYSq6LcRv8mK4sWFW9ZlSfbxtcZu37AFkycohOxbMDTBLJMN1FFUpT4MvjMBPJVna
	mFHgftvMTqAC3OwUrhToYJLqxjkxNWhG3h+iA3SXrcTlLd2qu8VeVJceRqHpePYxMoCxJ/0olvY
	/vcBtHebTFvOQmqi42ZoT/KHAKGsrunVvist4ohFIxIqN6groLkzmw21mhRIm2zRitap5pE7QkV
	61C4DEqFbgs1FNt2LJU2DBJsz9pHqChfdonzhRUtYS0TppLHJaREUzwgKkLtwZrI5Lil6fhYA3p
	0XbNl5mCKDZwKCFGKQ4TSDgx6s63kUnjaaAs=
X-Received: by 2002:a05:622a:1aa3:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51bff78f4a3mr26922481cf.5.1782741387002;
        Mon, 29 Jun 2026 06:56:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa3:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51bff78f4a3mr26922051cf.5.1782741386549;
        Mon, 29 Jun 2026 06:56:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1256c8c643sm253823866b.52.2026.06.29.06.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:56:25 -0700 (PDT)
Message-ID: <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:56:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfX/EAPuqLXYC5X
 m5wuf7lk28H1tAG9aji1RZ3XfLEvTkFJeYgm64ztNoBbf/Ug2JcReeLqimtqpzMdS175DJ4VVRk
 sVEftG/aSN9x9KljhwfCmy9CNHwb5TiGFiN44QCQKvXkLe3wiaqjqeTNJJ5EB2+pbBB/LVJxD9K
 au29CWs3/l06fqoV5cG/qZzpcESJ+cRHKCFSfLZHB6PKgBsJzhEMOzMp5m8bhU2Udy6Eoyp9fgE
 ifZWNpV0M6vWv+qqPL5D8fg4aVxkloGUZDdm8Cr4J+dWPfdCaRfUnBMAg7CsUHNEjYNjRUhDpWG
 xLCC4XsTBoh462rbEc8UcO8+Djr6gNxOTDdQFWe3nC++e9wDSLN5nE91hE8Vdk8l8zoq8uw0DvD
 rSBvHrHTkg5/26jRtnAFxEhmUw90vHlldHI6XFDfI9cHPpeGRfMfurxxttscJkOLuqYdnY6RBTz
 6/L084oychE5k80qcfA==
X-Proofpoint-ORIG-GUID: u6m-zlDAZeIy7IhLkwhCs0UZ178vSpR7
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42798c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=JHnfRRq-H4B07R_KW4EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfXzSTZauJ7utw4
 etFr277kKymkBilR5wa8esX3NeAwOGoYHc+zVXQwFH+6NXWzAdmLbBLtCLCtpOHKoHPW91NNp8g
 jtmqsR94l/ICzNR57guWfOCmSdHKOdw=
X-Proofpoint-GUID: u6m-zlDAZeIy7IhLkwhCs0UZ178vSpR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115120-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,bootlin.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 502A46DBA27

On 6/29/26 2:32 PM, Kuldeep Singh wrote:
> On 29-06-2026 17:24, Konrad Dybcio wrote:
>> On 6/29/26 9:35 AM, Kuldeep Singh wrote:
>>> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>
>>> Add the dedicated ICE node for kodiak and reference it from the SDHC
>>> controller via qcom,ice.
>>>
>>> Keep the ICE node disabled by default in kodiak.dtsi and enable it in
>>> board DTS files where the corresponding SDHC node is enabled.
>>
>> Is there a reason to disable it in the first place?
>>
>> Keeping it enabled it would ensure that the core is parked
>> if it was left on by the bootloader
> Yes, observed an issue on kodiak Soc which supports both ufs-ice and
> sdhc-ice.
> 
> CRYPTO_INLINE_ENGINE flag can be set to m via 2 configs MMC_CRYPTO and
> SCSI_UFS_CRYPTO. In default defconfig, SCSI_UFS_CRYPTO is enabled
> default and hence, CRYPTO_INLINE_ENGINE is enabled irrespective of
> MMC_CRYPTO state.
> https://elixir.bootlin.com/linux/v7.1.2/source/arch/arm64/configs/defconfig#L1325
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/mmc/host/Kconfig#L614
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/ufs/host/Kconfig#L62
> 
> Kodiak Soc supporting both ufs/sdhc results in initiating both ice
> instances which in turn votes the clock in driver. In general, ice clock
> suspend/resume sequence is later controller by ufs/sdhc controller once
> the corresponding ice instance is initialised.
> 
> Since, qcs6490-rb3gen2(having only ufs storage) doesn't have emmc
> storage but sdhc-ice DT node still probes the driver, later sdhci-msm
> never takes ice instance(as sdhc_1 is disabled) but ice-clocks are
> remained voted on.
> 
> This results in an issue and hence, trying to fix it by enabling ice
> only when corresponding storage controller is enabled be it ufs or sdhc.
> ufs/sdhc are default disabled and enabled per DTS, hence following same
> convention with ice DT nodes too.
> 
> I am planning to update other DTs too with same change.
> Suggestions are welcome!

qcom_ice_probe()
  -> qcom_ice_create()
    -> devm_clk_get_optional_enabled()

If we remove the _enabled suffix and put a ice_resume() in ice_get(),
I believe this is no longer an issue

Konrad

