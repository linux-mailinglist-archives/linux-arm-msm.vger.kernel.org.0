Return-Path: <linux-arm-msm+bounces-114559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lc31L1NCPWqc0QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7F6C6E25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fwu5jO2E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DJQ22mPH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114559-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114559-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 785B63016531
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AA83E7167;
	Thu, 25 Jun 2026 14:59:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB490331ECC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 14:59:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399556; cv=none; b=loFYagQItiGORf8dlbT2iVIg1y7idOAfTxbT3IZGdG4OG3XzyaZmNWVaRAgRTShwD5wlaYJo9eGgtvrVNETwpjeyTkyAvi9M9hyDzIzmSwgpOF2fqWW0rNyCxewUxh7Cii1yh3AJ02wacrHLMcG7f0lo/KAbwjXvl25iO37d30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399556; c=relaxed/simple;
	bh=gnMm3WQJlNpev15bu9mc3FCVKCZx764ic1J3kbbxV2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWSi0Sz7f6FVu8Y6pYhiFffbzmMgu1VZb9xcv6vsJ0/pAtt+bh9WNJm0RcGdEej8RFJkzr0ROsyV2m4ptEe+5Qc/KLnrb4iG3kHojmPjBCNYd9jT14w6dGYbZ7fV5wVIEjpe+ocOKh2jQba7nPnMi8GV4IRtz4Drr5OJhPmI0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwu5jO2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJQ22mPH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PEwDdE2416990
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 14:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERj4hIVMm3C/NLlG3rHWWiNfE6LvOTwPFfl/UgwDkeQ=; b=fwu5jO2Ewdyqmzs/
	r1bI0rIr1HkRn0l9GKtU58hW0fYp9VAQv7qRv7dX7rCKkiVON6YwZoHBGn+HgFlC
	72TmiL/qE68IZ5dE7rfInI2fLNKYt/vZZskFUwGet1leYhsDs8mCGxx7coDJMDqS
	LIgRRx6BFU/cdlaQHMrC7VzTBlWFjnbVdXPck4Xf600rp/RYmVOGF0xgpW9K02sy
	380eU7J84BF3B+flAjocQM/8YKxk/KH7YOuqlPtubPmSi7DdGpKr+zJ3YuIiEyOV
	e1baaG9RIHmtMvKZWQjH766OEwBZnVYcAr8v5NBstoKYbJRr4S4tIE+oCTRr2I6e
	NVI6vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jg8049-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 14:59:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517878a92c5so36119231cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782399553; x=1783004353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERj4hIVMm3C/NLlG3rHWWiNfE6LvOTwPFfl/UgwDkeQ=;
        b=DJQ22mPHMnQsSshPTNx3GOoueG2livUiELTRZEoGWw6HLowOCalCEPaHuYiowlTu5o
         B9KjftlrwlSYiEXY1ZoDbyxIepCHgRzqrHlX1GwYT3m436xgWSztQKEauAtKxlrc921d
         2fJPbNQHEh5WLiTjGbMD5g1lcRxH3P7GMzr9g68ukTrjGgLChZe8tLHkTjwcZo5Lw7/Y
         fOII/wYayaKjTfHkFN612f6jQqAyEyPUnGnCRw8Y1DeGPAXV71mps22/9QmerOr1WaOC
         7gwNCH0nWBOa/oOc6Df7iWFGzCp9lW+vcK8ILnMIqm5C5luRhm4DmoH6ouFyQjsXDSjL
         qZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399553; x=1783004353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERj4hIVMm3C/NLlG3rHWWiNfE6LvOTwPFfl/UgwDkeQ=;
        b=Y7n/lU40zwMPApJNbR/bgNiJmuoWm0jhzLgNrr8H+do7n7HnTGWivoE1r5JATZkysb
         R/pjnI9+K/G12cws/7XndDMj/9ZN0s4LXjCfoWgdTOD4+9on9HJYHftkd4z9GHhO/al9
         CwaxhS3kDFCPLG4SEK5TqB4q0ls0U4Kn5SEhcmsvCjR1xoYX3OUm4VLnktMTI7207j9E
         xt6XNLbGKaQf4ILm6NRyKz3esFlsA73uMDYBlHkEPdiqmuPTX38+XrtndxrgH6yf2zTu
         pU4RAQmTHkCYLcoJ8zTZo5TDl5kBOztHVVuj4o4k979iSMC6/cyvB89AYduCi+GGKaj1
         UqAg==
X-Forwarded-Encrypted: i=1; AFNElJ/cBAwWMqGLk2arom7qKsBG8vUeFR+YlNzUFyRvXVWxvW1d7xJV+DnjvO2NBRPq8PuP4pzcYE9hgMgAehn5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz24syr66LbszTwDe4Jp1P/L3I3od5d7TeXuNO03M8AgkFXqZW
	qwFncLalSmmm1MeCOzFP22LMYs6lMv5hLObuIus3jMj5zMSpg4QDa1TPtqanSFjH3dGULjK9wbb
	mGoZjHXUvApawsv12auUlWmD+/3zvl+uShc/IQ7LagV1hlffI0/CZJBc62xRW/512Davd
X-Gm-Gg: AfdE7ckrXeUWPilS6IX7+1BQe+0xOGT/cAJzcXRCmm2OYZ6Pek54fXSBBDHx2az4Pzh
	iTYLwKKo6MVCZRwNnugJQmF6M62IAJ1sMpGSObdhaGbGtM5dFxfxfS42TMUGSszcGbGT+onX8vH
	8hoFfwehlHAqg0MGBS3pXkFXZpGKm3M3wY2OZPxd6ItEKF4wj5rx5EchL+wFVJP/Y+nQdPzUgpb
	KDhmAy2XpSK2R0Hgx5luc6XnpkXPGsdBmW7Xe9mY6++fQbXDoFRS4gkMeRvGTiJ5fW/uutGgohU
	lPXXJ8BkEGLjY/OYJD0CEC1YqfltB7pMCrNSyXDaXX2HYOQOwkzMDISwKAcL26+6E3DG7fXOaFE
	iuGp/NcR4VBU6lIcZY6RgfRltN0QOLNSUO4VjOfw3
X-Received: by 2002:ac8:7f51:0:b0:50e:6182:b4c with SMTP id d75a77b69052e-51a727b4fc7mr38548681cf.25.1782399553131;
        Thu, 25 Jun 2026 07:59:13 -0700 (PDT)
X-Received: by 2002:ac8:7f51:0:b0:50e:6182:b4c with SMTP id d75a77b69052e-51a727b4fc7mr38548191cf.25.1782399552655;
        Thu, 25 Jun 2026 07:59:12 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm73357791cf.24.2026.06.25.07.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 07:59:12 -0700 (PDT)
Message-ID: <4ceb69dd-4c4f-46b4-93d2-4e4c7bf0146b@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 20:29:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: core: Abort active target transfer on controller
 suspend
To: Mark Brown <broonie@kernel.org>
Cc: bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com>
 <730c2055-b29f-419d-99f2-bc4df3b6a2f7@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <730c2055-b29f-419d-99f2-bc4df3b6a2f7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyOCBTYWx0ZWRfX5qFa/NrQPv3j
 2RkeWjzAjzDR42EDcQCkzhy71x5LXTcRaCwBKPonSXVKnYVyt5jtmGzCC72UXJwz1FpiDkVN+lH
 IwpXgONjGnXH6YqBlVqr0x/JXuSehGrE/WUyZYS2YVXXQm2hnxzCScWRRZIgw9JmJGJ1CL1pWKP
 GCq6CN4AbHaf3oG6YdmjuvZBXmQhJDqmJ+YQWqdDlhTUU0OEyVrkpLdU+SZ/h9Z9dCX8FkFdkio
 JfxZp9jxaNu4hQ7cjB4KiGKwbuidcAlytw6IGSTxfs7dTK1GaOx4Aq4CLtfcdFXHYPMnw6/vkPm
 LcdHkeyRMT3t0DpldMQC02zZwZ3Wpd6mcTAjvleulUWcCkndjfd/v73fvtyvDfFpbjM5Hrqh+Zm
 ulGiEnvNBCgyX0dEWnWklbXrOm/8CmI5cAikC5d3hNFslPYnqX2qvmVIuGZGflyeb5znBnts3la
 ZQlUGSzCHe08cXCMJUw==
X-Proofpoint-ORIG-GUID: 6FhTWp7l1du8jPrM1axno-ozZv8ACx6o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyOCBTYWx0ZWRfXz3WRfAs8dxNb
 3TvaJMsOOrlx0UNCjNIEjwEy7OR6o1Kgs6USEcIgq1RiEff3Odd0s3qp8L646BlXyAOrzsnK64v
 VSPrViOr78yFk5Q6c27qhllWShjj94g=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3d4241 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=EzYcgOYpdvJVRNjdZ+O3HA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0Ud4EHsjdzI14k2cJ-sA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6FhTWp7l1du8jPrM1axno-ozZv8ACx6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF7F6C6E25

Hi Mark

On 25-06-2026 18:57, Mark Brown wrote:
> On Thu, Jun 25, 2026 at 11:09:35AM +0530, Praveen Talari wrote:
>> When an SPI controller operating in target mode has a transfer in
>> progress at the time of system suspend, the suspend path proceeds
>> without aborting the ongoing transfer. This can leave the hardware in
>> an inconsistent state, potentially causing the system to hang or fail
>> to resume cleanly.
>>
>> Fix this by invoking the controller's target_abort callback from
>> spi_controller_suspend() when the controller is in target mode and the
>> callback is registered. This ensures any active target transfer is
>> cleanly terminated before the controller is suspended.
>>   
>> +	if (spi_controller_is_target(ctlr) && ctlr->target_abort)
>> +		ctlr->target_abort(ctlr);
>> +
> We need to check for an active message here, drivers are going to
> assume there's an in progress operation to cancel - for example the
> pxa2xx driver unconditionally sets cur_msg->status during abort which is
> going to go badly without a cur_msg.
Yes, i got it. Our spi driver had that check in target_abort.

is it fine?

if (ctrl->cur_msg && spi_controller_is_target(ctlr) && ctlr->target_abort)


Thanks,

Praveen Talari





