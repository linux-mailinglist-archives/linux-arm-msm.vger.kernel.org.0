Return-Path: <linux-arm-msm+bounces-107075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIdvCeL2AmrezAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:46:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5251E012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A0E9301CA57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FCF4968F6;
	Tue, 12 May 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayc425Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXsP0jip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D238CFE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579049; cv=none; b=pSggRKyyq9ODeqqvNqV+buoxpTceY80gXRrfTCByZtT2FY/qSoD1uXbJ4reDq5JGVtt4A4edETEaX2O/nJR+qzUbcdnFJUm2aW6u4JU5N01qX5a66oYssQZyvMyk5iAPkckbL5YLps2H3RH9d3J6fZnmeJoDZpfvHf0pfRGdcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579049; c=relaxed/simple;
	bh=Qr1nf5Xha3Mh/hw1Q30JIFQr2Qbe+dT6JAAhBNMo3/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfcjwZFEI1lm7uhvFOg+3XkYwcIiEAfqrF7Fzfbbz1rhZpw878lQNOXsKkdpCab+x1xu3bqCClszL8dh1jbHZzbJO3O5izEV9/osFgoh2AsxhOmpuzO2ghiyCxNBQOPXmcEwKyENZXjDfPD7pDQAKesQmaMlWCvX4fJ5zeobRYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayc425Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXsP0jip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5LG9k3385016
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=; b=ayc425MmSsO2M5zf
	+hW2qL4eexmByKjHvnguCHZObeQwnGo5bGqw+Cd8Tv4plmMOsMM7HHMqEQqfcLRk
	D4nAK0E9ZQyvUt+qAqdYCoE/besCoQxxOLrIvQCIm+iMTavZLNuB9DFjlk5NUc5V
	gJDnRE7M4S1Mbk2bto5ntWE0Ru5vZae+MxB/dbb+wVeed1rwmnQWJloZrJRTaPOS
	RNMH+Ba4s2bQZMuYZbWVTdaBYhCO+iGyIYWYODUekbfYPyi20bzGc+nqqVzu7CQG
	7wCelJNzEp+T48MR0vPiTkKsdSnhbEnl1lXAjw5EciOOubLBO+S5X0POLWIpUFwv
	UZjL3w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4jgcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:44:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so464625e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778579046; x=1779183846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=;
        b=TXsP0jipAyhU9qPUmLsTcmKdqNEvyGfPGCq8FCWbnub7OcqMGJPg0JOOGNr5SxP6dm
         Bd+BmewOiyxOtayWpBJMAeUkww4GHbS8vacb0IHzg5tmI64EA71FaTaqsK+xs6B9hV2h
         vMDKw8Jtvvm9XxspLWtx7sNK0/dsP73MHQy8K/mmF2aRAGToC7nHWy5WFUqyZQ+xm2/C
         TEMKKKF7UwekRLBzxea0s4QXodhtuDbBnLsCVqKFmY5LhWRVy/2l+XcT6olXVKon38mc
         rbttc2znwcB6gPCvlcsd71KDcr6nw9JGWSDzTNRezszubHmduOHr9UT8Y5Y0C5vK+Bu3
         mESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579046; x=1779183846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=;
        b=hSIIogWzxk7yt6lNnW/35vJILeYkK6LzPqu/Xzgqvd6NhZktCQ1TLkiGpxvmGKTSym
         m0kcreSw6U7MsOllghJ8EM6rj6KY9I0VlGWc944bg6l0ho+NmTUuSd7XISiOFVr3tolJ
         UzhdBXL4e7BRZ8qkn2NR8tBY6d/YNNG70ogVvo+CxvjQf2SWSh4nlq66QpScqdJ68Wd+
         sMpkmGQ2grfyd4GYmHnBtmuBeyGTJBLhoZ7O6BOkmJQncuDB4uI6aR8gTvktf3QSlWxy
         m611L6f6QQ2ajVtvIJ1zsnyHsTx4ZL2GsWyCx0U2bt5jBIa7kYZpTqDKPVKM2/RTnfON
         CjtA==
X-Forwarded-Encrypted: i=1; AFNElJ/ve0/vkohOAsR5LPrd6UWpacpTUu8WQ+jihRnxBJ+cqoT6oDmcJ/dMImNr+AjCnJv1nQQ7sy99Av/Wl4MN@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAs/ow4193PAEvhy2YPRvuv5YZwFgf1V1tS2rtGgoYE0/91GO
	pXqUI1LEUmrCLHvObnuEaOWBegHT9x8IwJt8XUbprtOpgmV0thvbSF/B2dZ6glr8uxril55GII2
	FsJ+0PsrthKlMm6dlS1bqKk+ie2XR6BVTIAwvKHxcuXq7awTBf+J5Dc79g5e8ocrIO5Mf
X-Gm-Gg: Acq92OGr5urZJgotItClnWepk9K875B3ksjlpwzThJTvwihYzrnHZVoexZtBzGlYmCL
	wQifRDG1ez7ntI3a1BY8sTDoSQbJSv4xOzfjU95WaEQpsFcs4AqF41jyOK7jopPnsg08WJuLWH+
	+ocEH6PiBhDiAOotXnlDvkowBwoQZdUZ0YEWanWXudh60Pbf0VY1SqovZAb/0SjQ2dMk9kUKEAS
	pPTN6KYfGUtsFk8bJtbbT0fCJRUdb2LrXRo/bqJifYTK17/05yecjS9282FEZVnmuxumdSX0Pfh
	GsLe8fIgVvWLx8ECD6gKT8S3VxGQWF48CURRHv+cI28NzyvdQzXsyV6aoPU3OxSQTzDhkHOqeD+
	Qkyk2cp9jNGITEuLaNCFSHLf4CX9D0CmYmHQO8Sy92micxdvKIFAAduh5xfPyOiaQobdempLVOC
	1/Dsg=
X-Received: by 2002:a05:6123:420f:20b0:575:1954:439d with SMTP id 71dfb90a1353d-5755b44d400mr4487368e0c.3.1778579046518;
        Tue, 12 May 2026 02:44:06 -0700 (PDT)
X-Received: by 2002:a05:6123:420f:20b0:575:1954:439d with SMTP id 71dfb90a1353d-5755b44d400mr4487364e0c.3.1778579046119;
        Tue, 12 May 2026 02:44:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc1ba096cfsm512321566b.34.2026.05.12.02.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:44:05 -0700 (PDT)
Message-ID: <1b39329a-a900-42e0-a7f8-68b7467f8361@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] hwspinlock: qcom: avoid uninitialized struct
 members
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Andy Gross <agross@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org
References: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02f667 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=vOGn5UrjK5pWd9rhyCsA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5NyBTYWx0ZWRfXz4VjLDcm9yIE
 5i8OBIVOTqcANefIhgcMzEXcgZ8ZOGnHNVAzxA4n2/7eZQLnPLgpTKJlhHb471WFMApqwBj9yoT
 gLWznerjMZ0jjpeR7BbWqvBtbj4IjedfanVCEfj1+9wEbFGyOmYkXonrMYhyXKeh2FAfxfwBOoI
 d46E5vsD3zaOyzjxlkz1ytlUkI1WIl/ygFosvwJa0sfBKiv2Ij8s86xrRqZn7U50obhUEOQ9W2z
 D6tTA+ERejOqu7b7IDsWDM4UHylOlkEEcE6lBS0/XfVY7eQugLzRA/Z5bDRA8cBGsdHxSbdK/cH
 yNLxENr9KCfmoJ3XC337S3IUwDb0SKY0fKbZkkl+S8nzdbbvnVwTCuZMmDZLRTD4C25zfwCqohh
 K+iqQiyr+xMy2m+gFlTIWsybuKBWb7dJSu+tLkwbFTstWTUpHJXzTSJqtTtN5CLYV0xmNPw37Nh
 JPegvDPv8PE8soPjjYw==
X-Proofpoint-ORIG-GUID: jjeeyA90fWMZJIvCZFnxDQhT5a2TTByx
X-Proofpoint-GUID: jjeeyA90fWMZJIvCZFnxDQhT5a2TTByx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120097
X-Rspamd-Queue-Id: 79E5251E012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sang-engineering.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107075-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 11:13 AM, Wolfram Sang wrote:
> The reg_field is allocated on stack, so using the REG_FIELD macro will
> ensure that unused members do not have uninitialized values.
> 
> Fixes: 19a0f61224d2 ("hwspinlock: qcom: Add support for Qualcomm HW Mutex block")
> Link: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

