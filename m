Return-Path: <linux-arm-msm+bounces-99370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AxYiN4mNwWmaTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:59:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 776942FBBC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30B08301AA74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBE83CCFC0;
	Mon, 23 Mar 2026 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5FwOEIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFND4ec0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E403CC9FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289775; cv=none; b=oJbL30LLplAXsux0E+aL2roVPkhjJBcii0QSKR7VIQskhalswukYuE5yxKHoMxhMx6Ywd9sZ05XEWzNNI6k+k9sWvWo/HF9Rbihnjtkd6n6eMd02wo/IOUx05aObZRl5XOSzXsFTtJ/xVmaz2DfoqgVKGmAm0t8YXDV61OQ5iwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289775; c=relaxed/simple;
	bh=AHkrab8FjMIfXIuCvFU94YWqLrlh7O7+AliofJ8LF+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMOAhupZB6fqvLSatb8eNxrK+mT4GRwzXfzNtm9AysypG3tHTmM2NjVCSExkNELycNND5pLT7uZ72MXd5jobivltxcNvJyvLGbt2MpDyoV+4lduaBoxN36Cm3VTEcjCJ0AeissyTxYkSf2IOrnaVTkTsAP2eg2B4yE3Gie+4HpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5FwOEIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFND4ec0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHquEQ618658
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=; b=N5FwOEIBYHwiK/ME
	7Xx2OWz92Qga6MM2uyuO537Pv2jpCKtIeTP9cBs8GwYsk2tJL8u2CIQl2jLIMViE
	U1IvRhWKvVwb+S23QSyzbMtnd9OtCPZAGFIBGyJRCjZ9IlrSAMbGbSg2qFMUzPSy
	z8s980PcIUHy6jTsIjaxqMqZZCyyonKkiMYKE6VywFoBvHh4oB7xzMhC//LgOXTY
	T/dRbBz7fAyIt7VBN8pr5x8ULulD58GLZ7puBwhRoteNz1Z5xO71fJRKu4eTvLwy
	gCc7KwrsCenXO23j7onVZkDBfpioEWHHeRqvQs62bg9jV9INKH6veiPDyGWUr6D9
	QMq6iQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgj8b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:16:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so43357985ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774289771; x=1774894571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=;
        b=YFND4ec0IvOnLC0zSePwS0s0FSgjvsGaGzyfKhLp1haOqSpka6RbSm993WAEeYjrS6
         +BEmLSGv1HuKOTMig8aCXuUnEIo7sO17bgX37Q4756OXzbutHALtn1L4Db4acSdyQdtV
         KY3OXys/pbfsJXpJ96ZFfIrJHnWhlegOxqvZmO6R97zWb/FxrRoAAUIdDQr89JpyiC8a
         ch+6G2I18h2ueO6vmkt0xdA/BOWueLVFQJjgPKoKQj2atIDHaFr3RHbag6I+DZiTtRsc
         IgJXk6p2T9tMOFLqFmziohdvtpRth4ngfQi9mqvlUE+zazRl0r8gwq0IgCEv4PX7O+bi
         KZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289771; x=1774894571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=;
        b=jttu7/qNK0yQpVWAR/p8dXrQKeyp9p7WJUl8bpxfSU3OTOZahKi+s7KXeMXyTGCqr6
         2PqZ3UatK6A+XPp0axMVwfRR+yO7t7bqxqJPKM0y8YdvG1r6Bgi8zf7HBmMOULgVtqHD
         y0uWi30u9W+dvpFSdZRXKaktwccZ7xpt6LAzDFz9Y7IfHKc+OE4ooqHnAaAiSlNALVrV
         SClKn47tIRfON/gaCo1Zx85V+rpc5SIgdsySBienUOAxrHxVOkX+CPid3wa/Cr06MnFP
         vO9Go7qXm7hBneaVg9e03kpysS7FpK9kU6OpuKd0XdvFA/jiwOJrUzzzM4qUDIgQ9c19
         mmhg==
X-Forwarded-Encrypted: i=1; AJvYcCW6vnH1z14hv18hlEtwCYXxYE8popuM1hLZp7MrgqNoWKCvef/oY1S8DrQ6whbUbvqdYKVxEbk4i9qlve90@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Xqje7J70/yxrzeEzapDRJwDPJnUtFQS8jiirhszLS3xU9N3h
	nCgn87ECauj2F3hJOonjBhErcnQrUFFOJxDYHiKgtshfvKWdT/vm2bQiU5xy0byI7bqBM60Jwc/
	gyo/T1Rl0k7vjPrFFfQdZxRuYOd8HOsvveoQsTP6vg+bt2AcOYss73l25E4UkYCeUYtRi
X-Gm-Gg: ATEYQzyXXjDOnL3M25tslpQanXdEoq5o82ZwBpSKAet+klgX1jPjnfEUHG1BPDCZBZg
	LOk+JSCBamTJdotz+nUy15pTfb3xnT6RlCSUF3d4wc97KQ9MvC9ga58+xqChhiKnzRl1KYc0dFI
	K06etATlg4d99lhm3mJb1bFGz7VRTsTGGl16p7YvTpk0U/W6/yI42gVbKwYpVbAwZqgqrmkYTVx
	Q88RjcDyj48SELc/P8rAdPGDeMRhc8+dok2WZB7kpbA/53mEAG/54mQjKjuLsjlU1ukTCkriFbH
	XAvIOj5IRO9I7U3Y+3/j7m91qK/aBxCgrQ+boWXKcDzK2PVKAMPs81CQfzz2PpZIHsvzGKewrtk
	mdZE6jxuKkgtCAWYPrO5hGe47OyTSYD1UW9UxH71Ibe9NjkNp
X-Received: by 2002:a17:903:2c10:b0:2ae:ced7:465f with SMTP id d9443c01a7336-2b0a4db3af2mr3954225ad.7.1774289771190;
        Mon, 23 Mar 2026 11:16:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2ae:ced7:465f with SMTP id d9443c01a7336-2b0a4db3af2mr3953945ad.7.1774289770636;
        Mon, 23 Mar 2026 11:16:10 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3430sm112302905ad.79.2026.03.23.11.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:16:10 -0700 (PDT)
Message-ID: <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 23:46:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
 <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IctTL735s2uc8FFCIwvioYzfd5VZqyMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzNSBTYWx0ZWRfX7TvikYhdtFfh
 XUPmTkcHDtZ5EPyVKZnjHeu5+AchvunMrhaPtdpXdUylbGGba1cEqEZVUZL9SESj5MogpmOWIvk
 S0TMJoA7z3f2nsApbTvVdy6/73uxZ/8Uyu6fZ9OT5Luew+WKouYJKECoo86Peam/0q0RwW/qV/8
 P1dJINh4zHeJ3CXaEVw/rZms23Z/hZXpL2QpKbIYCb2yCzEORE1E/AgT2wggufcKMwmq06SlNKt
 Po1TnCqyymPinqaG1xxFwR4YVMkJWZj8cVyN++I8pffK7l+AXmjx3bbFvXNG2oRla//Kdpiae2r
 RJ1lP3HiXbZoRXqLikJ1EfYxdh6qbRWhucDs5QZsozg53L8msKCD2mzsTi3GrKHcKK0e5xCtFmg
 m3RvtRuBgeFmJrOXjg9jSHeL3A9fBSom6h+dD1hFNc5g+1uRwfgNaex2j9gCiArSWqlhwvh9uQo
 CYoPsqly1Pc8Wkrquug==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1836b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=htRBAqg6l9hWmXmz9CoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: IctTL735s2uc8FFCIwvioYzfd5VZqyMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99370-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 776942FBBC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 11:33 PM, Abel Vesa wrote:
> On 26-03-22 18:08:21, Abel Vesa wrote:
>> The UFS MCQ mode is currently not functional in the driver. Eliza is
>> the first platform enabling it, which results in UFS failures at runtime
>> with errors such as:
>>
>>    ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>>    ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
>>
>> The failures occur when accessing the UFS device, while the controller
>> and PHY initialize correctly.
>>
>> Disable MCQ mode by removing the corresponding register range. This can
>> be reverted once MCQ support is fixed in the driver.
> 
> Nitin, care to comment?

Hi Abel,

Validated MCQ on SM8750 and SM8650 now with ESI both enabled and 
disabled, and it is working as expected with no errors observed. 
Mounting, read/write operations, and runtime suspend/resume were 
validated successfully. will post the MCQ enablement device tree changes 
for these targets tomorrow.

It appears that some changes may be missing on Eliza, which will need to 
be debugged separately.

Regards,
Nitin

