Return-Path: <linux-arm-msm+bounces-90633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA3JDecjeGlcoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:33:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC78F07D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A1F73004CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757CF22DA1C;
	Tue, 27 Jan 2026 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkcT6rxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6yv3pXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5BF45C0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481186; cv=none; b=eULf+4mNJqCjNPo4y0hI+gIylJC5uQ8oy1eFs71/+DjBjY3lISvnr6gWfohbCrHV7QN7CPTcvtRZxADxiTY7zdqyqGxNVfRBsAeXtTfiNRXGysnfNliIf/NxT/dtEqskqOmCNn1cAFu7oLSvvSfuFACt8p2I+g53NPaEZGVdenA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481186; c=relaxed/simple;
	bh=qYGUwbXihG/iKmuSDdI9HDtkTLx4YPjlctibyxe8mIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzBwl552NS1pu1GcDp5KTIw/gnHkqL7dwZK0EZno1yieuOXuG1VBnqjLnnlBIhOxQC/q8VKKFcT/RLlFrP+E8Dpp/XDj6ERh1SuB9n6aCAQWzfhOV/blTonsSawwmyC2hbOx8BUinRZxYV/8QmI8VojVDIHQdu6sh3Ud4MwkHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkcT6rxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6yv3pXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgc0v3913493
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeVwqmKTK9RiVoW+opV4NCCJgRTh0FhVJy/OJcSidIQ=; b=UkcT6rxbQeTqZVvi
	EVZUrjj35iTHjK9XaNW8K088za7xQcqtvA17A2gP7wMbl7M6ktDL12/HqI+rBGNi
	wr//lvUFGz+FXldRAPC/+/aZKP1aymZuuxtgIkG88tIDtUZXHACeKpwKHDk2POTF
	Rt6Y3NGNRNIaKQLUtLz1DpajRlSkFEQFlGFj0dxqnFdcIVfazCc3PGH3CaB1L7cN
	3/j47fkONdx0FhnDarjOE8NRAYzVoPxwmDAqFGWLCHhOqWjpu5r//yyUyD0tPkC0
	LBjimzLRfiZS+R389dMjDnj/+lCJps5Jv9lwK3KHzPtmpW47SVkHgn4BNNsw/IQ7
	jIz+WQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3rx0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:33:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-353049e6047so3784064a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769481184; x=1770085984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeVwqmKTK9RiVoW+opV4NCCJgRTh0FhVJy/OJcSidIQ=;
        b=d6yv3pXzfu7szrhXcOArNltRun8SiEwAnVH5zAzxnu2bnVu8ebtxu8pbKfagcOhWBH
         SAtniuRo53xQZBVzv3wtMuG5POm4NWio3QlJ5q/NqejlPMchCogBdfl/vGnSe9xwHFPX
         O5qXhYkg74v2z2KjsuhjR759VRdcbogsvCzuAQSutNPDpFyRInd9K0Ol7oPF7sc80kUC
         61pSvY5t8efbsuUZpQJoV8p8ltCffs/RbOtA554tyJbRIAjhMq4JJo98R6trCoTggIce
         otC4Ce50fooni54DaWbdgFff/BYhKOnv7hc4sQ/ycD9JwMaUabnfCHq6uVqw/4Yts/nj
         dWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481184; x=1770085984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeVwqmKTK9RiVoW+opV4NCCJgRTh0FhVJy/OJcSidIQ=;
        b=AP1qavLvpObs9u+t+e1eRv3MkX0yJlamHky2JbvGfBUuxt7u0u9aa6uu3f/LcNS3xs
         GzXDK91owVrpmci8zTvTm/xfsRxn10wmuEi30YePIewhw+lgXj/MysPXbt14adnHt/LC
         vsZbRmATfXMaCWLCsMNXmQHd2yysXV/h7HyJNPxj14gjuY56BWNu+AAYTu6YSqlAhn49
         GmGdyjyp81osMqO0mKUnVB2dpM9Kdw7lEPf5ykJXGXQjVsQyuAFuohlX4FJaWa0+oG70
         9hiTA4jTTpzqLB9pKOaTg/BB8zqlTzXQpvJT7Nv+qtOFZ8U6av55g+k7YxNR90Ok8iml
         1CcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJmeBox9mKW/gAAjBX+GhwHJxtYLYzI9/nviDTkPyXLAKta0sninG4GpIDLQz2Dt+S4IeE4mg2faC/2303@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/vXN3hEDC5smoTCkisMwFqZ/sMvPYzsPihS6a7kKJrlVCZsp
	05NmNzdw4S2lbMS5ZIKRaxGRtTvDvb1y4eF3yspYG6fBwb7XnBOJXgWIssUZ/DTTFv8fZXUBE/a
	CdQQDFdTc5w8Si7MPzdCXLvQ2L724r1JLN6C9hcz+Ur9q/7M5IUGrez/xWvUujDrC7/5C
X-Gm-Gg: AZuq6aIcUdCMYgmXnDXytKXDWyjGaqGYaFfQJJdMWRyuw5ld2s5MOLhZ/WaD3rcs4He
	hyqzfZkOcRk24t0/w0irAWhL6me44yH8df1yMSFJElMP2DHfx+/e1aVSU0xjGWxbQmPnVvxLern
	DlD/dhb2jKCsc//eKPzzk7p0BQZu2UO8vsyEGS+dX2dZmFdUFUcMNJ0Xq0YfYhvDHqx3YFpimoD
	zZQy/QxbdUVZNYTSFtr3LOD28YUHF4pqI1BWz7AijBFaVQjegRSpUieNI3xI7wimE6vHC4ax6yU
	mX6xP44FzIZrz1Z3rpIhvY7YDXbn01ahydVdPghkV+vQfvLK/fPOgj1ysooUOL2X/TkncFxIcfd
	ifF1NXt6SDrS5FlOey7nvrobnTD0CHX3xwPM=
X-Received: by 2002:a17:90b:3901:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-353fecd08edmr313117a91.2.1769481183847;
        Mon, 26 Jan 2026 18:33:03 -0800 (PST)
X-Received: by 2002:a17:90b:3901:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-353fecd08edmr313100a91.2.1769481183394;
        Mon, 26 Jan 2026 18:33:03 -0800 (PST)
Received: from [10.253.12.216] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e763sm10305727b3a.55.2026.01.26.18.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:33:03 -0800 (PST)
Message-ID: <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:32:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
Content-Language: en-US
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w9Ly-OB-JWLVy0zo62Z9prqiqcLijbpL
X-Proofpoint-GUID: w9Ly-OB-JWLVy0zo62Z9prqiqcLijbpL
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=697823e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F7sWkcXy6VlY_Ae0a_4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMCBTYWx0ZWRfXyPWwe92UiRY3
 d7DW5HnQvJmxeRCcdrTOJqijxYZaQTxaGgIObz4y07F2LtdktMeyu66BneqgYTvv4d58hJlFV0V
 Z2fx/g4SwXeukK9YK7M8FDEqNS1ZnLEJhhLv1RvSU+WQbUdjKfCWJdm7JhWcv1CMkyGIIoL2ZEG
 ACy4ImiMcPcZDjjxyRurRDioPZ3epAj4GleD7Fn4johQtjhcegq2jxCrprGgaWlSGZ5h/Sk8RKW
 qRYhPRJDBZHdtvX8mK9QE0P6QLtM0dUrpzMQVW2cEJTocttUC1srlX0N1EAMl/I/x8JMG/NnWmL
 ffJUBf3CR5RgqiVDqrByd0S69TFzAXBvxusvJ7jpIUxt7lqxHL0ew/F+qz3emek2VsdTI6sdKm/
 mmGgDryWqsykAY1id5NU8OmXcditSXTx1mym63HoVr0vQ8MzGMOQoa5zmzEjS1TDYphaPlxCI+g
 eHKpGIopmyGx0ov7rDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-90633-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51AC78F07D
X-Rspamd-Action: no action



On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
>> data structures to enable Hands-Free Profile (HFP) hardware
>> offload support on these Qualcomm Bluetooth chipsets.
>>
>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Any other chips which would benefit from this flag? If you are setting
> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
> set for WCN6750?
> 

Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
considered at this time.

