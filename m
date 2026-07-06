Return-Path: <linux-arm-msm+bounces-116949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xy04If3uS2r0dAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2897144B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EmOt1d4z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e/iDLJlf";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3985232961F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E95424671;
	Mon,  6 Jul 2026 16:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F21414DDD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353600; cv=none; b=svwq4Vq8UYo+AqJYVXrs6w6QUxL+KIquK7xPRwZlK+lbrUghbMthxKDvXNPrnwkRxm8gPKkEBrz1KiFO4mKufUCQdohW0lvz3gWj6MJGhvpPoT9KryUarT7reasFJgJ0GzmisTSIDTMjyZ9Anc8Aj+7vpFxqdqL6eZds6KOmxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353600; c=relaxed/simple;
	bh=hx9hFVRpS614H5BAyhPDMyQPp4NKocJkb05aPAhprV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzje9PyKuqpDfn7jb+Cjed4wslk+r57J1QEwTBQ6yykdL7VJqST/wE5hYkoGGzHAGVnh5p9WEF9dVojzuIiItylz9dMH/J8+poif2+Wu8aMQeq8+TEZmAd5vPVC91dJO3XHeDy0ywBbqfohhyStf2x+4p/ZkMJkw9egV/061E34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmOt1d4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/iDLJlf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8Ev833180
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=; b=EmOt1d4zvYCEMKXn
	PgJjgDRRZG8LwLCtni3y5WUAcFOwLe+/abXrYliwUq0Op8d//m/1Chm9/kez0v8i
	buZExoeYovTt4zCeZwDh97lkTYH5A3OhjAe3miPujOBJ06WrjCd7gdz8k94pERVw
	OqNT50N9Oc6FLlBHJ2BnhshkLSHy7+BYqhjWABfoKP7vIr0pRczeQs2dGDgsa9Ua
	ZkDwoMkyGv/HTZWsTrvc3xnjN8O4y0aJWJVzVshOd+o4DUaiWbYNlqdjf0hMLwIH
	64Q7xVArmGKZ/4/t+/zm3klnSa2ttaAAwoY5yX1avyStweGTtmZg9rmg7y0+tgL0
	c6rh9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98hk11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:59:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e777a15so6071711cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353597; x=1783958397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=;
        b=e/iDLJlfcER5ixMqjWEbZnOTeIqenw76t6N9wJ7gsRO3qIrNCytX6X4BF9rQwEfgaT
         Fw3Rt22SM4bk04nIH9qWlNYJNwxJLRTj527kIR6RwcJBrGbfHDbMygTldGusT9ld15mP
         5SlWR4dbEl34e8W3SN35gLDjPoZd/BqK0+lnOLXKDJfbQxIbWmbhHd9fvQO07DvkY6bF
         4bju6ZKImdqnSRQMm1zoRRapsEMDS2TCGSgzP6P5wGbrpcyzoYGHe1uWlFt2iRRvG502
         A+QcSdYENY1RwGeVOaaZt4adURGjCR5n9K3Og2kj/E2xFbp5F+FNDK+BrZgNqPzh6rsQ
         x6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353597; x=1783958397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=;
        b=p/L4so2P9JGmaE0leqDMkViwvWqsCCqOcnJ84fuP6wJqPs9RN10lm07VhVW6sGcrpM
         GRDv0jwE330gN2yiy6cg65clFp+PQRGxD5pfQYBOg0IWY0Jyt5mdATL2fynrqBU5JM6v
         78Z1JkBaZNpfsHXAsVIMW+rm18moWbBQomFIF5qBK1Zuk3whDeForE54OzBC6BRqfuR/
         4GN+WyVXAX2MHUC2JVpn73Kxlxi4w2Ual3jvNSIG2DMdjqdPNYncEm+tOzRSAY7T9kL2
         /T8PP7F3onQQ9NvKEmd1+ROytx8Twf01LvIZbP1SZXoRigyizb6jivVdPns1sY4m1bnV
         ukeA==
X-Forwarded-Encrypted: i=1; AHgh+RpQBgBtb4ugNR/IxQlOQAxMBv+LOMefSyI0XDX9v+h2V65v12WrCYo7wdhw5SYDeNQRUieosZIgfSTjTXgS@vger.kernel.org
X-Gm-Message-State: AOJu0YwuveRI2Her77enbFhWxbqhwueS0moT9fcZHy2RCHnVFpcfJjPA
	d4Lh9pyN2Ukq+8TFVCueoxy+fRDiVxzhWClTJ1Hfak7RXWejxOQJ/JzDMp69UnZ1REGy2BUaY8o
	4hxg/BlGRfohkXjZpPRLGIaMQ7m9IKnXM1JoRZFcpsesZ5BCOftGJgWwqs38JMUimzCsj
X-Gm-Gg: AfdE7cm6+CyGd1nEexZHgVJdrmDPAdmzBPi37jBHvHc1RpRGElSE5yCdZLcMV3vKP3B
	Q6KD8DFnEyW2NGsKtz3SokMArzF+TsLX8o7y2bLmwtXEZN8160CsY1LyEfx1KJTZNNpAZ1iqMKf
	VVuOLQtWnfkpHqgorrTmhcspy/oGElfkJyBOcfhHjlXyOnE3lbgy6rw0h0npY/IzToNa5tT0uL2
	4QyiY+ETApwu5oe3G2zhec+05Q7yeTLiBiKuiuuaraVL2BvThzyW82Fg/mYaV0gkShuC1hMvSU8
	A99UnTu0rAZm9NsJsaSuC82sIMUDAMPnveX45JXmYoONEotMx1M72xKwCLyqPNvsV/g7Ouw2bN7
	27LDzKZ4uaYkEoL2kzQbDqp82qa2yWDRz8Yo=
X-Received: by 2002:ac8:7f93:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c4bf181ddmr100375191cf.9.1783353597320;
        Mon, 06 Jul 2026 08:59:57 -0700 (PDT)
X-Received: by 2002:ac8:7f93:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c4bf181ddmr100374851cf.9.1783353596808;
        Mon, 06 Jul 2026 08:59:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm771602066b.17.2026.07.06.08.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:59:55 -0700 (PDT)
Message-ID: <dc99e50a-76ae-4f92-8eae-eedbbf39c58d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bd0fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NXwEpaCvRp95LVLdM_UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX/9Qe8oT5IYrn
 8/Jus0Eh+6Ik3X7VVR8/TsBdpi58TtDDaknNt5ElRzvsejY1FKrsicrULSWsIV/xH8WGl5kJZCV
 n4GecDGgR9x4KHDzZvysEmrS67hrsa5b2OUZBTRlyOoPfo7k979gHByb3idHkeRkfmv+feFTxI7
 SUMrp/5C7J8sP3HvBsKW3j/+byn6xmexXk6sAmASvn/FoNiyVpppy5sHmFLozcYcPR7kSVZ58Y5
 0gNVzJxDuH408PuJ2b1X0Tij+GSBNNfhjCdfOBnfhh6LYHh6cQk+DmMC5T1Wm2lzWBx0hcjPm/o
 XeSug0PRSXgAciKK1ErCGVARje7y3IYWAD0mmD+zkXX/pX84dvUzC8DMEJu+kCm1WN1YJRLQxnG
 IxTVM6all+MGGgqEAMZHJDkNluoec0f2TV9bHHcofLvVpi+N8+7aQrJRcVaVe3zpSq38dnUUT/h
 om7rPUcI5hhdPKUtE3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX5+9VVmhEOS3C
 m5NbY9BIQk1jng6e2FzOSmTaBZexQDGWF4xFL2QfiXOwcS2G8g/f6rExAxJYtoRsvMQ0cKCU3Lf
 5hvy448fyteCDtgQlM+XM/MqVO0m0CE=
X-Proofpoint-GUID: 9UA22D3y3-_oRu7mjFldueOi72kNUr-m
X-Proofpoint-ORIG-GUID: 9UA22D3y3-_oRu7mjFldueOi72kNUr-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060162
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
	TAGGED_FROM(0.00)[bounces-116949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED2897144B5

On 7/6/26 5:37 PM, Stephan Gerhold wrote:
> On MDM9607, the modem firmware exposes the QMI subsystem control service
> with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:
> 
>   $ qrtr-lookup
>   Service Version Instance Node  Port
>        43       2       34    3     1 Subsystem control service
> 
> Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
> service never shows up with this ID, leading to the following error when
> trying to shutdown the modem:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> Set the correct ssctl_id to allow clean shutdown of the modem firmware with
> the subsystem control service. ssctl_id 0x22 is also used by other
> modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.
> 
> Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

The downstream DT hasn't caught that.. but we can clearly see
otherwise in the output of the command you provided

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

