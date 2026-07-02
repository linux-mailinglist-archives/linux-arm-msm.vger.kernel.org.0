Return-Path: <linux-arm-msm+bounces-115920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D/wtG1FBRmqeMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:45:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ED6F61DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:45:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Co/2ALop";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jpiui3n+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 145A131ACA24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296AF48A2BD;
	Thu,  2 Jul 2026 09:54:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A747F2C3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:54:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986053; cv=none; b=QtLLzLmoLio0mpGCit6uUCTZ0ZwlcCkSvMCkVnDoZXGtlsLKfEsgofCgOxV9pwTgvmkaXqqxLddwcRAs+RlMDBG0PavWNYn3FsvzsykwFff4Tm53m+f1j2VQZ/6XFnjgpjW+g2sfeRX1WFpSj7Yb/vJp5U3lCQak7uK53M3stKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986053; c=relaxed/simple;
	bh=AezmFx5Wtci31wUqFLY4bQVP5R4WkgLXSWeduNpKmwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtNMHHwCUlMdenv3/QL4wMQ0vdhacpmMmCVCDlc+vVWyKKfF8lM+3VUtUEOhuuxiXlhIF4NKSG3PzMbdum1LGAPiA5BNK6uMT8lQKT/qt2u0MD5618/enoTJ+4AmuuqomUH9Q1wYkXK0xhTT8t9oRMC7bd0t75E+EYWbV5qwvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Co/2ALop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpiui3n+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628ZaRZ3046363
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xnPLJj4Uc5qa4i9PczWzcIIWL314hS/sHHZdcnn8n4=; b=Co/2ALopFmtxtcLG
	N0eIJRmuGwpGBIVXtPCND2Re9PjjL5sN2KsrWH+ga7E0T4gajmXLS3f8f9Paw76o
	6r0LdPECaMuYt1QWrVrpRtNdptpvev7DfmlfqnkuUVT2lRptuszt8n3kTLfcRPuR
	EpqiRpw7SVUQa43EG1rN8jgsQe4uyTKzU2f018TbykeVR9z0ekQTjT2R6kSxQURk
	607+lP+eOCsm5grujxvbaa9osvqMR6OGv18bYcf5T1DynoLPq4KQgqzTWgWol9Mp
	rDCtkZjI6fLiipq5PVeEvj2P/68bwEXXoQo28pfN2Hm3q0WRQmFdJyMGHznWApTG
	3NVQlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3awnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:54:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so3266491cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986050; x=1783590850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xnPLJj4Uc5qa4i9PczWzcIIWL314hS/sHHZdcnn8n4=;
        b=jpiui3n+X7ooGtGI8ZsQtxpHxQxxV2sbsnvb4XWgGXGyaUbX14Oj9V2P+rgsSM1lDp
         nddTlVr9EuFxnvFUdWiGfRdJ7RuuV7/Q/PBoMC71lwtCFJUBa9eQc5i+j7aHt2hvDuUV
         q4s0kNWUP+0mhBWXeDdnBQl6pokIBuHV0G2KykOVUhWGowk815qUk9z7BEpQ00wLbj/K
         dxQU0agUZa8FTuz9+JQojIYPYlUjARtEpIA2taI+4gU6v34UdW6GTA2yzV04ytYqO6Yg
         sfwR2XX/alv3vc5fj1jrnpAJLp5eGH1BL5jD7baMqKpJN835jbPvxzgvcxPKsRPOXg8C
         DkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986050; x=1783590850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xnPLJj4Uc5qa4i9PczWzcIIWL314hS/sHHZdcnn8n4=;
        b=rtornMet3sAAKuzdEKwSr1Ql/0KXhFDFL6R3i4H9HmpeGYP4k1wmzkd0HreERJy1jU
         T99NeeINJFBEfFHdEjIZrQ2BSwHYI1+KYdxecPWyAWH6vS/hEjDR3oArRcIFDT5fpq/3
         LUz7nW7vCYlC0Dzk8mJVq61n6py+ofLRqWSNVbTBStuzNGu+c+ayYZ1fVMnVxRdUG2Ue
         mjNt5tQUHhe630Wdy32vmNLp3oURoZ36C24zt/h86XJ8nMsrwDyf5AJo/mLLa16UbEdB
         Qwp1fJ9fbofbrgPRn5Un0lM1/uHR7tM9oWywQEYnDuqIK7kzZrTkJPeTyPPHbwnN/vg6
         s5JA==
X-Gm-Message-State: AOJu0Yw1F53dSDJ0VEvLj9ECaZhyEQz205xHLtCuEpUJnfUqr3pticyh
	KjxbTwYO5tLp9D+XyZK/v14MWfD52qvEhUAPxisamHWiOsaujZETBfehENtBiUuM6WvWur3CIL7
	xhI4ELg2OhEQyM3qMdtIV1XLtpRY23ieH0MvhUDcbTBQyF3xdGofxb/GUgCWSEHYXUI0L
X-Gm-Gg: AfdE7ck6lU634NEG0SVpdIaFD2YUddBp7c7FblUBBUB2Ta68FMlND7Rk8p9R+vfCo00
	GP0FTTz5SKOCpTxdHiRIXbURHcXFkFAEW/+yjC7U+7qupJ69FG1lltmTuYrWigNCUmciy0bIlPs
	5uE8kbx7DunsGtbNNvbVa9u1LDo9BIcntsi4v+VP+dPs785yvJGso8RIJVVYqGng7t02iWg9wiO
	2ksZ/Uo2aa8bRI4/Gu66x/oCI0TqVSxP7FT69rGfNyWjgnXXswZov/zKfXakgljCPlYP95aiyej
	5AwE6pDMjXwCRnpfT66RZOwJYcAS1TtazR/CokZUbcaqHzH1FsceNN9++GIVMdGKnWTSvJbDzEx
	dC05PuVCBdJuKjzV5V4ZG1OPJBs5Hw7VUJUw=
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr42241231cf.4.1782986050350;
        Thu, 02 Jul 2026 02:54:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr42241111cf.4.1782986049986;
        Thu, 02 Jul 2026 02:54:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf46619sm713391a12.11.2026.07.02.02.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:54:08 -0700 (PDT)
Message-ID: <f5991078-72e5-4953-9af0-def835acb510@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-2-02f5ce02c95a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-2-02f5ce02c95a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX9saUPlXJBwXA
 /8iqGGXSaU0wK/9itjzOBWRhUYgDdKZo5/hLH/XAq2Z6z6HzzDXjUoHoQcnANufYhllcVYv65PI
 5HVCHT4W27dMMxy5JGGKbrybwRmi/ZlJZtQu813xXkjM2FCKQbMNc+ekV0GODVeY1i7WH9kpaR8
 e1nM4FahwVuU+Gb69qZ0AV5OAILkWTfM7v07+M9iSlbhsOksgOifHQW7Ewxa/Fy3qj021x1X1+v
 bngMUBDyoLGw2Wr2ed7+IX1DxDu3S3GeQ+VfVYJpUzlAc3aDmttOtDbHru8XeR5+d2mFovuxpja
 MLuaJPdlWa1wYQt3PShzCsVrHvNcBxyfLKPTWebuAkLrluPY3H/LAcpVX4FulyaV7Gb6JKbqvQW
 Gzwo1/ITPLEzG9lYg7bL1tgnvYWHdnfKQePE6IwtrTXRmaDwIDlXwn/L5f84T7shEZKiTVDKljs
 yyZzSt2Bs4ja/N4dH7w==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a463542 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4Cl4fHb1CvEXUs1CtTUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfXyhJvu/E1XzJu
 9XcuG5Fkh8L1WiH9iu2KNOAjWGCqDSTNsubtsWPSvXQODMxFAF5f0EH4pK2zUCeJerfJwxEsgtg
 gZLOBj3BZSGZM8SpF3OQOyWvyrGNshY=
X-Proofpoint-ORIG-GUID: KN2XTluXfYdYNrewGe3Kx_tsPp_3_0MF
X-Proofpoint-GUID: KN2XTluXfYdYNrewGe3Kx_tsPp_3_0MF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115920-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC1ED6F61DC

On 7/1/26 3:38 PM, Bartosz Golaszewski wrote:
> Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
> whenever ownership is transferred) to replace open-coded
> qcom_tzmem_free() calls and their associated goto labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

