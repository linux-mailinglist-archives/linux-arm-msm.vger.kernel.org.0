Return-Path: <linux-arm-msm+bounces-114088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id idicNn4jOmr22AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:11:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A546B45E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:11:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bJPmCmu2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xq0U8KgZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D13F43011EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D263AE70A;
	Tue, 23 Jun 2026 06:11:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB1399CE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:10:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195065; cv=none; b=oCVRE+DaePlUHEaVCsio8/QymrSgVfCcfKwChGXxpgrX8bbLEXqF26L87V4Z1PXxfvq2wpG88Aoda8u5W5lM03p59zr10RM8FuRXj44H0ldUFxIK+LfOmnWYAy4rllun/ekaUZ0BCFuShVAzep0Hug/dST7IsuW0ZJTXZh9XpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195065; c=relaxed/simple;
	bh=An93r6atHIL6rwjLrAyy+PRR6c90xs2VuccXAJ0FMvg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XrjOqMSLbtsjKOR18sm5tkPDwOOiEonqgjqgNEkEAPgCRVzT953QttNISLUF1xGoxhudeF6k8JtOL2841wDM3/p3rSIBFHYmnGFQjnNOdrGrKijtvu1/siwGKVCDiCWalR8LsCNjrFnL64jsntIXXNkmZfbLVqj02kchnm6Vuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJPmCmu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq0U8KgZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0llfa2788629
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=; b=bJPmCmu2sH9jXztE
	GZaO/Xg+MKHfkJEn5+MD8qpWbrDuk9wDxhWoh0QeLB2ctiJlZnv9GJiJuQsj/XXb
	qTHwM0BKsjejOjfwmrEYztvRtPH5dSUBBwXp3IBNOFsBkThzQNNc47MHlvft1+H5
	Xqy0Vg4OOQ42BqvB7zBK4Y8Rc7L0cIvxrJCj/MHrPhG+4pkuvgsGFIxiPTGDQNdZ
	g8Q5tpE8fN4LledBpsOY488zHtqntCZtP1DG0PWcrybhUB7nDHLWSt0UqEdRzpNn
	vsXByBxQUGEkSWccwQDjtmg1edSUssCXRsUVyrhGiIEoGOUt0Pil4/uZfWBiqA1E
	cPEWZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n438es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:10:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b74447so3374480a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195057; x=1782799857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=;
        b=Xq0U8KgZmizMR0FQ5la1CIehILKOCi3qBnMUxNhKF1+lfwTSOS0ZX61/GmqQATmKkH
         lehwzgmJG+3E4XTvTfiXyESw7mLuObDC29/iDsSbAzoZy5UucqSWGIkNaZuHSG/jWe9U
         679WJ3udJtKsJpKqZNZ+a88bH2C66rxTLrzDpflJLXU6SwwXAjw1fk2Mn1fNb1om7/GI
         fWThkNkzr7p4b9xckrEq8UAK9Yl06nC81wqrrrm1CqwdVqt4yDbcTjP87Iz+2+ewEUbs
         65EKBZA38iFgLB+mNhG7eIaqDE++zVijkFqKaMIyDSbiWsk9HqM2RpoEWq8XOL7x28JS
         rZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195057; x=1782799857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=;
        b=JJBcR2a3+aNTXjbBdW4azZ93kqn1q9g8KvEWqXH+DMhoMXFSvdhxkmsBZzh3hhtzk+
         AkK/gwwUvR8W/akWLC+Nw1l3kVUj7mrk6OiTouvFyIMXfXnGH1bkEjabv7vJ2vKRTCsh
         5xckiRxGM2jQuSqtUXMrVHgjBPZ/T+cEzEIpVVscwlJYJOdL+cq4HIAJ0N5ofCrBWj4T
         QyLE8LJTdJCo51YFgmPqHKZ/N8vPtP+1Mhok1EDQO/Zw/qgL1q1PDslK2kM9Qu0UTCcX
         pqoP5lRt4xmHo/y+EMU7ef7MGXm2S3pMgxVU7w81qQ58zcugh1s2YuXnmM5znrXOXoiU
         0uyw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2CESWulvGTyAm1NAAFxJMzdChZbeiswjKEHZMb1qw6Ig2gX+SNGl8d+Uo5OlPqkX8FSFM+0Pte7x2wW5F@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTCYJBlEtIHD2i3ziqLqOzThZw3YBt25lOYrL42Y0Cyu72PBY
	BZCR8LAbpszelWCFKE1Yv74d9l0vmwxp/lae69su7wpSYiuYpRtp52OfYvP7qlfrTfejcXdnYvw
	Z/CCy+PixaRwPE1qc/FzXKgyTWGp3PZcEjX8KC1pyibkChET2CMcoDiD4EqNxstjy0Nzk
X-Gm-Gg: AfdE7clDxNV7Ng65ROqhkwc10cpd3PiWbCRcX7lAqBCku+zFLoX/xFYB/0ZBLwLixEo
	8udwm+POQigLDytN5c4RTVyFpS9B6gpdSBK94pynPoP1hoe42Cbc/+nj84Fa5zFKij2yAUKadi7
	HUUQktIia3/l/xRzC00UuDQwaFgcedQPEiqyufQOFOtPhDH2QCsP40jHvKhIfzCDaD4jwLw5Lyg
	Vw4U48R70kx6JEmCsmNForuVRPNCpuVHUMh3IZBBKdV5Caz06vDiXe2hRwL9Kd9eBquuiuljnsn
	0vCDxBtq/KLUUdf0aGVKxYqoGHE+n8zWynSwNV6OJu3cKkrs/siNV7MTaIrnskpx+103qLMe9nN
	i14cT72hhZ3ADc24+viuUpP1APy8tfvr3ArQtpCShJjKbDOo5eif2Ll2kEamEnD6mIFLfuQ/SAP
	v2NQsKNQ==
X-Received: by 2002:a17:90b:380f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37d160489famr16689074a91.9.1782195056634;
        Mon, 22 Jun 2026 23:10:56 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37d160489famr16689047a91.9.1782195056152;
        Mon, 22 Jun 2026 23:10:56 -0700 (PDT)
Received: from [10.249.22.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1536b541sm11655278a91.1.2026.06.22.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:10:55 -0700 (PDT)
Message-ID: <be7f6f19-6c79-41fe-b656-01065a69064f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:10:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
 <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
 <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX4VqDCnS2Hph0
 HUvSIAEMSZoCCiYTi3zGPx68asIP6zbnDPoP7lq3zIEPBBcDamB8aq46SRYurp3LLhkAO3GT5Eg
 GpNJMua2SefPgcE0YVdbJDMkvmFp2XU=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a2371 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wAVQDYQ2tgOr7hSGGKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ZmFrikFymjzFWYER76Ax0kLXOHSSOwgd
X-Proofpoint-GUID: ZmFrikFymjzFWYER76Ax0kLXOHSSOwgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX/hHyMnhKuwy3
 RxB26838eF6bT83bXNcXQuowbdwXs9mVUcH+bUOTSxnf7mLEWiumhW9VEJ6rryCoCKnR71CoOH9
 yKJ/otUJ491Gj2WkwFeom+ha8o4fM12KeP5DqaBHumJ88+P+2gUVmq54+xb98TRE2f6P9BLXL3G
 mVg1Nn1UaKmLdxWhSTFcQ/WXrc6qsvNw4c4ptW5c8le27yKBv6TQNCYwXLBuSmQf/MgSKeBpKe+
 1X8ZlvCP5ZizxFTRREZCSr4akvm2vT+fRT7EQMXfFYKeFXlRtXzHkgAq5o0Cadwz4e4wxAq3+x9
 QovqsGnwMDw/EwvhzZMpohXvXaV9osFDipBN4cqR3GJ7CVqesxdTQ8KNEJguo9m3AF08pgrEKpU
 zDROyGE+PjMGgWI1b0FSz5ppD+GWxcttmXJTvyUQtbbSas2isINXPLy/OC4MjXOCjaEE6+SDNcN
 6hpqTzuFCB9pUYtv93w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114088-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71A546B45E0



On 2026/6/8 4:37, Dmitry Baryshkov wrote:
>> +	{
>> +		.cap_id = REQUEST_SYNC_FRAME,
>> +		.min = 0,
>> +		.max = 0,
>> +		.step_or_mask = 0,
>> +		.value = 0,
> 
> How does it work if min = max = 0?
> 
>> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
>> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>> +		.set = iris_set_req_sync_frame,
>> +	},
>>   };
>>   
> 

When using this cap, the value here is not actually read, so it runs 
fine. But I think you're right — max should be set to 1.
Will be fixed in the next version.

-- 
Best Regards,
Wangao


