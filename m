Return-Path: <linux-arm-msm+bounces-92985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBNoKyQwk2mI2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09672144E17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8E773021E84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E670313555;
	Mon, 16 Feb 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOv0twFC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1CgWYTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9D31329B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253780; cv=none; b=NynWnZ4ltZlogcij4ytPvKn8qZZsQdS6tE3+koxLCcQhbq1NjZUPwHFeC5fXevTu9vGBJFh7nJ5hhgv2yM4j4yag5vZs3eOOyCBkiDrboZ+kVvIuLwNdnLmcLxR3jSCwoiKmsMNJiX+z3g6qXdt8COfcQIB3Hn/2F7qwPAhSoxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253780; c=relaxed/simple;
	bh=khjyDN2uhks3lEh5BWoTr1Hhk9opwtupB9YuYrs0yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmLbzRDu9yXVqB55BijJawfgAet3pNqFubVACX3UR8NBV6/FcUQ5YWrwgbJ2iozTMWDHSxIVB6Va3yjT1SRnkOOiZSedwtVwtlJSYyxyDjjzXG5YtPLNT5vR9LET62KICC69twZoZS5MKxBG/TnNHPucXEMNNzpt6XQ/hxmkZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOv0twFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1CgWYTX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBtGWr3145983
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQWX3UQlIYFi0a7jRaznYPVGKQGU63wx8fL8q+mXUUo=; b=aOv0twFCc5RXC3DR
	x7C4GzqgPXwfHb3wPEvhSjU6l+NsxJlNRA4kXaPRCcS57nvTj3F6HiDKlJCl+C31
	qdSvNCKXmpUeJtTjvs5d/K4WkbGSaKJqMyouhZaGruZfXbwGVyAotidcpwufao86
	Qg6NSw2QM0Fo4RT8fJ8PcmRtNLsFLfNJpIKUdMGTB5ZpwpZHCBxCwPPoPcfBlp+T
	ZyhPIKC7RvSkF+Dk7Xq0Tcuq2gWZCMt5anhmWjN0aVVg8OT6deGbkwWg2TE3LmRU
	UBW+x7Uy/ZcfGuXxHJErKZMXk1t4O3UnabJI3VZ96zDLGjz4CW8CPQ8vEl3Kta5M
	Ek8yHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcmsk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:56:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50489a554e9so19567931cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771253777; x=1771858577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQWX3UQlIYFi0a7jRaznYPVGKQGU63wx8fL8q+mXUUo=;
        b=f1CgWYTXnmPZ6Z5sPF1thtYbkP0xJCEp565B95AeV3LLCOs0AI4IFRwCWo/hwLgnP6
         fdU7QGzlirXugYkBYiZw5DjA1eM97B/ShebKQzCZOjJx5qXqJn8VAMOLlkiG10lwp+m3
         +ZdHzUDtgaVi7cUbxGaShPm812djwXgUAUBFeEVMtPUKuyEKKa7oaWHNe/J7JeQQ6YF1
         77Cox6+4RrIPcZdM+BUTI5wMuSw9n95LOROW7xRFY+uf912gPDFiUng/dvUv8yuk2mDj
         uOH3gU1r5bZuD+62BjNA5uDLl6397hfDGRjrxxgHOnhQ0U9qK8+9O4TSebVK8boFt0u6
         c9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253777; x=1771858577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQWX3UQlIYFi0a7jRaznYPVGKQGU63wx8fL8q+mXUUo=;
        b=rkdhKOlJYtMlmi1ZHL2tUOVp8r8/cjbGqwTLnCgMWfnYCKA0TsZrJFuSvMEZ9UXXDK
         5aaP/9UZDoixUy94Fh3tWcV00ZLw/WEyRxWKxodOBDkCqoGEyE5/35OcfvCLLI+YDpwd
         DRLPnGgwB0fsuVjqAEN4l6Uqmb6Jkso9OyLHsEk7kUXzKA8ftmt+f7B2sDaZR0TfEmmh
         VMOnsaw8H8reR47sXC/z1eBGMgjh77IpukwWtvZeBRNVsNyNocvg9BHmMYq207130Vrj
         dSoGr589DZ/gt/N6GMrxZWb+Zwjz8anBprUgPSFAMv6J+FpJMgPxn9P+Mg680S7TpXZR
         PDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkUA1wXB63C78stybEBko2zJZe6CexMS/5/qLecB/2BIf2mk41gLcB5VvWgWZfhA58b0ghcCUIOBSlCECb@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCWh7vHoI13kAyPMbN5TK5xdBfNKB+XAuzcojjzhcANQQkn8I
	SEUfgNY+3GPvRxzHgm5ewTrBNzCFHwWX4UWRUKTacNyAx3iQFNWvTflacjQaLba6owIGKQAkElw
	HMDvsLDTY6PCOfIkCCRVSe9/ivEB0dSvNuLApLw7eC/9SJgipNI8MaVgqtZQY7/VoS1LQ
X-Gm-Gg: AZuq6aL1og2zDaUVT/WtEmpWncKt5fDr05FzX9tliu1TOkAI22bb2ozN7TMDNI855Qh
	EkG3h8LLVN9lbBr+ee5Us0a9qPurQZZuzIAez7GLNZRPQ6td529bXG4Qfezw1nvw4tboN6NIxrs
	zuJWdXuayCI7dPqzCfXXMlPIAkbEg0ByiAzWpcY3dbuSvKOtL68Lxo/fVWfMdwKbjE7AXXkquUa
	1+AKTjmZVQVzE+1SYWLVcep4RT4/AY3D1GgKLe9iXNCoLLpRw2iTpr7PVH92hmup+lTsIBTjFXT
	s3UEhGxQSabJPDAOaEkjdzePOw7Y3Z3YSs1G8t3LZ94LF6GnG6nRmWB+vptkh3eQr1wy5a5YdQV
	IMRV9PAdMQL+kJBu42UO0SdOyJ/l4VNRQzpuTlAIXqPQo++OqPahr0nh8scxNQC8nsNwYKCJMi4
	g3ZmE=
X-Received: by 2002:a05:622a:1109:b0:502:a1bb:632a with SMTP id d75a77b69052e-506a666cea5mr115892641cf.0.1771253777222;
        Mon, 16 Feb 2026 06:56:17 -0800 (PST)
X-Received: by 2002:a05:622a:1109:b0:502:a1bb:632a with SMTP id d75a77b69052e-506a666cea5mr115892171cf.0.1771253776687;
        Mon, 16 Feb 2026 06:56:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56a476sm3269353e87.32.2026.02.16.06.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 06:56:16 -0800 (PST)
Message-ID: <49540c43-894b-4d4c-8c46-4fe09d649729@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] phy: qcom: qmp-pcie: Skip PHY reset if already up
To: Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
 <nmle3y6nb4kjcwstzqxkqzaokeyjoegg6lxtmji57kxwh5snxa@p76v6dr7rgsg>
 <53f0c45f-7f5c-4abd-af84-cbb82d509872@linaro.org>
 <cvxvq7f2ku6aq5gbbqav42ckqk2raesbxq2bx46mxvapcza5v4@5zuyjdtn5us2>
 <aaqqdz2ssnetfgtybuerjfnkgr7r22xj2whaawaqhgm4y2ygom@jtkn5z2nw7aq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaqqdz2ssnetfgtybuerjfnkgr7r22xj2whaawaqhgm4y2ygom@jtkn5z2nw7aq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNyBTYWx0ZWRfX46s/ojwWsakP
 5anwopxB96oUqAc8zySPATHYEtIvzMrZNpENFC+ke7jszIn0WtTquGifuAMHOB+s+hdyroRnjy6
 U0W8b5lPsUOysZ7G0L47J/6XxD+KWaCfRbieWaGBE1ObRSg9E5OPUj7h2Nihw8j4HnExRYC/7HF
 +8G+bX09BDQ9+WnCCbvXkcDQ+OUv6jCJ/RzRGRrhb1WfecAj3NOfglnJ7eHXfH9mqZBaCkdAj4q
 DEiPN9jL1KXSAbtwz/ZvGY+nsTOoiSG22BaBXHleJUI1ARgb68cCnegIHK55wmV1mYzyBkd1fyr
 l1NNUb2ZRsL5dJ7Z8v1fA38VIeW4TlebsP8bflMuxCTh4v7egJJ8HhuU5N0x4UdZ4E5CawCN3xm
 9iHuDuuDBpv6kYcyLqi9OpNIsLakDqViL2zfT4rneUebbaaTwqhKVCjJic3aLcMzdlKQIctn09s
 rxOksy9E/vFKDuEF7TQ==
X-Proofpoint-ORIG-GUID: bZXJIhBhqzYQwoZS4o74V-re5zQTfKGe
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=69933012 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gjtn7LuX9S0b4PncKSUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bZXJIhBhqzYQwoZS4o74V-re5zQTfKGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92985-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09672144E17
X-Rspamd-Action: no action

On 2/16/26 3:53 PM, Manivannan Sadhasivam wrote:
> On Fri, Jan 09, 2026 at 04:03:37PM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 09, 2026 at 02:10:49PM +0100, Neil Armstrong wrote:
>>> On 1/9/26 14:08, Dmitry Baryshkov wrote:
>>>> On Fri, Jan 09, 2026 at 12:51:06PM +0530, Krishna Chaitanya Chundru wrote:
>>>>> If the bootloader has already powered up the PCIe PHY, doing a full
>>>>> reset and waiting for it to come up again slows down boot time.
>>>>
>>>> How big is the delay caused by it?
>>>>
>>>>>
>>>>> Add a check for PHY status and skip the reset steps when the PHY is
>>>>> already active. In this case, only enable the required resources during
>>>>> power-on. This works alongside the existing logic that skips the init
>>>>> sequence.
>>>>
>>>> Can we end up in a state where the bootloader has mis-setup the link? Or
>>>> the link going bad because of any glitch during the bootup?
>>>
>>> Good question, can we add a module parameter to force a full reset of the PHY in case
>>> the bootloader is buggy ?
>>
>> I'd suggest a simpler thing: if the reset was skipped, reset the PHY in
>> case of an error and retry. That's also one of the reasons why I asked
>> for skip_reset not to be the persistent value.
>>
> 
> I'm not sure what value would resetting the PHY provide in the case of failure.
> As per this patch, skip_reset is only going to be set for platforms where
> bootloader has already configured the PHY. So in the case of PHY link failure,
> simply resetting the PHY won't help IMO as the PHY register contents are going
> to be presistent due to nocsr_reset.

We can pull the not-nocsr_reset though?

Konrad

