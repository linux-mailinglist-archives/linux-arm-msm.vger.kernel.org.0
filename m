Return-Path: <linux-arm-msm+bounces-91907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE08AEB5hGlU3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:04:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99562F1A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C7AB300DEDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701803A9D96;
	Thu,  5 Feb 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5/KI6S0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jlq3nNeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4FF3A63EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289457; cv=none; b=rjY+SF+JXUw410tnTcbYYsY+HjGzWlxiKEb0gxuARGzCOdDO1H1KVPHNpUN4AYAQv4cG/FNzyJBbgMAi2DxME9oTVt7fIIFBZ+me1C9IRvbHHXIVRoYOD5GZBVCAN1VMDR4HoRRdPKCZny9/KxSK7/6JR1Jm/PzwNr5PvA7IY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289457; c=relaxed/simple;
	bh=JAo/8d59UVmAnMf83TNItObvhego7zO2k/FdTeG6uuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rw5EqP371i32mk+Vh83XX3e//eCbbahD4QLTHe79QLVxNf/yt2ObzI4EcWLf+TrENZZ3Pt4AAPpoWfY4rn7hyd2oPrI5QxSFk2yHU5AJ1UcZcwK9QvrfPBVpjYKoNqgkcmPrAwa2KUWnS4zINbhPhrFI7uJ/Z3hkqtiCKE24nrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5/KI6S0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jlq3nNeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153djaw2759475
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 11:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yl25ImK6eV6AFlhYHm8zRMKJZ8OsgCVkMwSD3/Rwja8=; b=R5/KI6S05NGyi6fd
	//jNGxFd/Y11qd7EtrXLmc9mp0OLWeSkPUyJ3InWImBW+AoyHR5qe6jSuCEzYIeb
	ijo70YiBYJn+uh64jBPFPYMZgtlWzc0deo75s/mnNsLYze01lDorORfljqb8yqFI
	ZjdZxjRRTNnDqFOhhostXmPq7oCQTvA/Wu/kB2DWcZGJUnr3nVaqQU8sWLMb6OdM
	YdFuSSLUaSL8JH8uEJymg17bVXFm7bKWct6eY8AvNYQ+SyTaqmL2DnSRDMZ5BWXm
	jtWOrZEuqfDZpW2nW3X9+rbHKh1KrRffpU9+sFoDbV0uXlWynjr1bithSFcvyfY0
	DQeKJA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4jpd1eau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 11:04:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946ebb51a0so3053356d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770289455; x=1770894255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yl25ImK6eV6AFlhYHm8zRMKJZ8OsgCVkMwSD3/Rwja8=;
        b=Jlq3nNeRoPhKilXY1YLyXbEKEprAad+J2jLhF+QbOZVUKBTO+B7fYLfFTOYovH435N
         ZxWAVGQZz2kNnJcffdaPNikWxsFi8wPSYKQ5bVD5QsSIqDj8d5Mg2lOEmv/PhgB2W5AE
         1eMBzI2lNU++QTsjRyFOmKFiO3k/goIrrSC/kYT6M88E+zZfSObtBQnlZRAJxNrWJUNI
         4lgQyKP0mHUYHa5rY3zwtit0NYUtAc9TGuMGtqlV8btar0DLvziYGl8O3QZcXLTRP77C
         GriLwd6AI7iTc/ppy6X95zbeWcY/ax2apOM86e/I/SsAXA+nF8jHBW1GpZ1UgEerzMJB
         fJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770289455; x=1770894255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl25ImK6eV6AFlhYHm8zRMKJZ8OsgCVkMwSD3/Rwja8=;
        b=CkjjHebYEDWiEQYP2+fBxhGvUlsGZzei1gue8mHssRvV58cMW3W3aGa6oPjzuXXvg4
         MD534Ce6ORl8glp8ETgh7OzuDVVzAlp/iFy9tgWTR2VbiwLKJ9frA8KbU/NYZxTU0mux
         W+iHu34Xlk3rkQhs687Ztl51TXRBUricvZB7ZcWHQJiRMz+C1zD3UMY6U3B9rrcIsQC/
         j+op8K5Gm5Jv2d2PdwyRGlt8ejwA2tqO8r79KZQVUix9MfV5MR1dD0+44lYRFV89T0sJ
         /HMHQyenHBxeyzoC2oqjycizfae+BufYvJkX8lG1Y8EQYkLehTeISU10sqg433Ii1Kfg
         IUxw==
X-Forwarded-Encrypted: i=1; AJvYcCUe2tEb+EibL8y8eXgJVSQ4DfHp4doYD6MstoxyhJJiKxgtGg84yHMk3D3JEJJrzznDyDzTuunR3YiXMTX5@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEJQJBhOcuaQvrokNpLUFB4oH1yEZSUuRwONmTPZbehTfF8/q
	7DhfOSYADlTak5fQ1PsPIccT4RcdnyXKFyxVWVXxti/pskCT5GDaUqMAY9LBWki8Thg5AEH5A8J
	hnUfhvYKhkZHcsZorujwrpJlVr5LDryP/HYmUGOS57bGD0pUefJ4Hm+ZrUMNl60qG6qaT
X-Gm-Gg: AZuq6aK4XMDArnoE5QSgw8eFYvoNIp1oYYGzHr+u8izyCkr2I/q1OkBxSgP/DcEJCBc
	XnZeEHZRmVeQ1m2k4Li4LgMroT0tMMY3EC7Bqu895aP+1maBRVvBNOa4uFQxshymjyK1xJmlHtF
	xPZyWAvauwFZO/+Ma2qOWFFv3TbN9dGJrGZ0xwTBR6p4mh211AoZJ6s9QwwLisaSgmaRE37t8/2
	DYmwmNCrxp8pq+7gc535wdGXYyJYRmEzCAUAus1mxrjvIKrXwHfmW2NhMPHIxbguktKIHT3WOXz
	JxgWqEewsQgy1roH3qZrjKpbPFZSA6Xpm1GZS3JwgbtvgKDeiNsKNr5t6O/GVwMKTrL+Q5nGGX6
	kV1DXgkRp24Xthl1s1A3re+dyyvBW1r8DqAO4JCxnezDxPT8XQ5KyUVIEoWv5kdgnBq0=
X-Received: by 2002:a05:6214:4f19:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-895246dff5amr49644866d6.2.1770289455144;
        Thu, 05 Feb 2026 03:04:15 -0800 (PST)
X-Received: by 2002:a05:6214:4f19:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-895246dff5amr49644466d6.2.1770289454638;
        Thu, 05 Feb 2026 03:04:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949fd8473sm1918468a12.13.2026.02.05.03.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 03:04:12 -0800 (PST)
Message-ID: <3153e8dc-f43e-42fe-b2a3-9cc4806634e1@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 12:04:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom_scm: Fix coccinelle warning
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260202113241.3058845-1-mukesh.ojha@oss.qualcomm.com>
 <f512db69-e187-4c6a-8080-7c02bcd46ee2@oss.qualcomm.com>
 <20260205082332.zcz3gvhljxr5u737@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205082332.zcz3gvhljxr5u737@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MSBTYWx0ZWRfXw1OLXFFZV8R8
 KftDSYNGn7qUd60DKQbP5EQdoAJ9aZ2YPsbv8ryJwRNWVMJ75HHXe7y+clMSS3/uE1StPXkrRBn
 sFvgl8b7f8TMBL4oNStz4fmDJj1u50b9Yp5lLRNM6CfuQOpF661x9N0fz9cdY3TKHVkMS3xmKmO
 7yvac4SJRpeZeftTs5TlcPpTT/mqmBI9kAZ6NThCHjYcsHXkshZwiiXkszR2nVTRnVIMDwK2GFe
 pihRCQIKXyGi7ZDdiXYJjr585Pk6OW6Ndc88oY1tRFoWyI+foU60+GX1oHpWVl6imu1M6IYGoPa
 yvpUueUlaTWGm5gVkGv8k8byjZkt/6CrWsS/RbyCHYUkSAE6Sa9j80aAkdCEpvU5GFMusH4BR2/
 fEwi4op5Vqz8qXTI7snTdSq2d1aQKCEweNpjoD3S5LK6iMS6FPpU6T20tyupf05S0wyY7ZNF+cn
 a/pAqq6RMYa+jbg2Mmg==
X-Proofpoint-GUID: Ejdkjie16--aGRqzJZG3Rt1K_aHUY57T
X-Authority-Analysis: v=2.4 cv=d7j4CBjE c=1 sm=1 tr=0 ts=69847930 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=tBk2aN73tq6PJOhYyUIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Ejdkjie16--aGRqzJZG3Rt1K_aHUY57T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91907-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99562F1A12
X-Rspamd-Action: no action

On 2/5/26 9:23 AM, Mukesh Ojha wrote:
> On Mon, Feb 02, 2026 at 12:51:31PM +0100, Konrad Dybcio wrote:
>> On 2/2/26 12:32 PM, Mukesh Ojha wrote:
>>> Fix coccinelle warning of allocation and memory copying to allocated
>>> memory by replacing with kmemdup.
>>>
>>> cocci warnings: (new ones prefixed by >>)
>>>>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>
>> Preferably the subject would say something like 'don't opencode kmemdup',
>> but that's minor
> 
> Thanks, Just checking if the tool name like coccinelle, smatch, sparse
> who may find some issue is not preferrable to get mentioned in commit at all ?

I think it's even required to mention it somewhere in the message..
I can't find the actual reference, but Greg said this last week:

https://lore.kernel.org/linux-arm-msm/2026012748-unblock-vacation-70b8@gregkh/

Konrad

