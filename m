Return-Path: <linux-arm-msm+bounces-104223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG9aAVva6WnolgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:37:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788B744EA02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0D66300CCBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901683DE44F;
	Thu, 23 Apr 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+tVaFRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXaH4cL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD23DDDBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933452; cv=none; b=mQVNeRrut4lapbtBABHOjm4qcvC1hk0efeet65rwi/S5q38Gi+ZHyPz/N+qFonETSHSGW/JyW+3RO8syDl4EIlq1Z32N4K4oWKfiE4fNmDVyJ4tQwAwmipYvLJ0ZVozKBdXc2V0tfD8A/PX9OnkfwzpRbVmfKoC7MV1cIbhtuCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933452; c=relaxed/simple;
	bh=iojg/kCFZKxr1/NOLpejh+M0hST54iJub36Hk2CT/Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/mYGxCo4j5QdW6Ls1H/Fa47HIS7KsIwfSEk0zzmLXNVvCHqeAuk2hlWJaL54wJuXOuiJ03EpulUWwoARyNp7uXzXYydCKJCgMBy2SSxbHa81eFx6FnF3i1kAzIvnOJh4uWCNbSZtRBe367TKm96mNHkV93fWkvxKJrbzUf/8zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+tVaFRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXaH4cL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N6RQtC4037434
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhRntaser1eVzeCOhXjlHkYnbt+wCG8FqFTGxoVYfmc=; b=c+tVaFRchVP8LYhx
	jG2ZJxHIb2ri2zlr/V0Q3HvIk1m/mlEI6XODj5f/adjlbQqLy/CTmIl5pUqKk7WN
	WcLHbDDXcsVd8NguauSXTEuZwAAySdkTKcy5YuRTVOuxYKfjTfoEC5+ZYaP7t5VZ
	V5Q/KK4cl9rQ1x0OUzzxytICrlN0v/N/7xxIxmw3h73o+Yn+aBVa4iyFws/AcmY0
	HiZMdW5CWBD/9LxP3SGjpD2xUe6clvI3PI5lb/zcMmaZcbHsM5XhiuOwEgyUFJub
	0Semb3Bw6xXm1M1Obd9HB5rgKD2coaRKuNHnWzfc5Xj+nxVUPMwroRYYydkJ1y/u
	INbWHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62gfy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:37:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b258636d16so65211675ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776933450; x=1777538250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhRntaser1eVzeCOhXjlHkYnbt+wCG8FqFTGxoVYfmc=;
        b=FXaH4cL4PSRCF1QLAror+h0Fo1U7p6j3raceYo1cd+xHLcFA0dzOIAwr1TFrMenyI3
         yzuIY27+MbofOpETcj+fn2LVsI5nr+ZzEL+dx0m0/C/PQNu1j2h6E4Fy8S8v99q0W/PE
         UXaf1XqhAIZ1S7op6CGbFnTBZTP29yoYT6sEdmOrjV9Y7UWixbxVWC0kMf8QfY8BEmHh
         k5UJ0iTTKDAL1xPcS+VM/lmj7nZsPYBzuil1GJholHtkPLpqTzlM39ls9FGRKMUITPTb
         gsd60Hx/sW/NU/19YdRw6ITgKE7dVMhBId9XwCMcecLj6000Bpv05hWd+GTYVRJ/xYN1
         yiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776933450; x=1777538250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhRntaser1eVzeCOhXjlHkYnbt+wCG8FqFTGxoVYfmc=;
        b=Z4UTQgQwhAydefkGbXYiTwqO2xo3GC+jHHggmtzP+e+ZzrihwYIE6jP4fhXBVKVwAQ
         REpAp6h5bTf6TxElX4jxO/XyBSekbQXmky3EV4FFNOySah/1CN6HZS0ECD4OBpVQqAia
         hpki2SYlw8fa7wetA/NyudADhtbOSG5LUbFrWXOBQAbTqonzVaBbNFaYJPq/dSdc32l7
         fteV612+LkGTrQVmeHnn+WQ0cUfDBXEWPd0uEB/jheoufGFl7dHMFLFd42vHPAzojYxa
         ZzXUt5FWDzW+AYKJ1DnwEb7SWd5ozbsI88QyNQPu1Zj7YBToe6va+hwZeD3zyfYMHY6v
         euxg==
X-Forwarded-Encrypted: i=1; AFNElJ/qyBAOhTNXpqVUR/DjNy61LjD0IWD2idu94D4IOP7ZGonqvpwYJreRDSNRn5cRLIJyYC5YpACMA40DuL5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxOp01U7VvD1LjCqgOutp9LeHysV7TJwj8AsYf+GEyXbRWzCmD7
	ZbQfgilKd3KQdiH3dLf067Ccwc4D1zVzMKRm4EI5Yv9jvrGyUgtPnBOfmifgZwdY7TMyEZnaCpy
	h/8rKKCi7CejpCDeN84t9yM7I/Hc/629NUNxqKFrBhndv/OAJi3EBiDVOuURoYtZYY+28
X-Gm-Gg: AeBDietWxQ2VEDrioJDP5d1giKgHTufHZErFxcEELqTzxkrwvx6SIPgIGOCkBEJe8W8
	Vd29GtH7qGwa+rsievL18n6qEsx8choDV620wHb23gUUeN9TobVqARtk8gLqRvmQZKvl5BFt7XM
	xG7iYFckSnfsdEboViwkQ6zG8trXN5jkpJPjlrAD/0Cf2A3uGK1jcZnr5N0+jfTpxo+UuT2duX7
	cPdHoT9nPTSAmumyPo48nQ5eDrp8cwIR6EGY+8HWRZqQgCE+ALNsOvOnRh/jfISGBnd5jVdkViX
	pt9KnLFqfuz5nxnqATYK3O3xF0fdedYGakAJPOBe1nzbe4l/ehHqPoz4OiYFycSEOI7ntVwa70O
	gYiDpSVl6v8Dq+Bq0H4PrzXHwOVN0v+kBaWr8DWJYhLNpicQh4AZliBsTRPTH
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr27613894a91.10.1776933449653;
        Thu, 23 Apr 2026 01:37:29 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr27613871a91.10.1776933449143;
        Thu, 23 Apr 2026 01:37:29 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36143b0dc2fsm19089888a91.3.2026.04.23.01.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:37:28 -0700 (PDT)
Message-ID: <52aa6442-7e0e-423d-beef-0ef2a6c06884@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:07:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
 <20260422092409.4107093-5-ekansh.gupta@oss.qualcomm.com>
 <jqehwyeoda5t5kabxjouc4kgpnebndotkr2a4tuuiypzqcck42@dv3vu7wbq6nh>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jqehwyeoda5t5kabxjouc4kgpnebndotkr2a4tuuiypzqcck42@dv3vu7wbq6nh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8xfLc5JsQQuS5pJ9ERPYhtQJGbV8_9jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4MyBTYWx0ZWRfX8KVZiA4bRSn4
 3rHxmn2xpXJ3VhG1GFjDlRUDmypK4bwjE2o7MWB5jaPFweKj53umlzjmIjGRdNB+0bWBBTSpQlQ
 Ls/ZUiYFuXJaJk64wwkM2OgvwR4HIMVEroYFw2XC8IJn2kyPxCHu1Pr9AxUVn/om5c/dw0KzRYC
 ZbkfB92Q41kAxrf6aw+Sk89s4Xgoy6Ng6HUuh9RQDvi+XC30pW4C0/twceHbp5+M6Wj0jCEDRat
 tZ1ipcWJH3awo40Z+BMuHHzn67OvQ7skmicd1b5RmvmD3GCXV9EJxHGewzisjnbXUXSESsiVfEu
 NC4toVm+isPhplbmBU+IG7VsO7Xuy3XqZlow9bWA86I3cabRkPXRRV5rDA/B56LCoJ4H96ev2Dl
 LQGWPpwFtouO1GZ/KV6b+uiT5AxqcApueNRbn1VpFKD8DID7/eaJTvjccySQYFPjVr9jsva15Xy
 ynHdizYbxLdNg2ilkhQ==
X-Proofpoint-ORIG-GUID: 8xfLc5JsQQuS5pJ9ERPYhtQJGbV8_9jZ
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9da4a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=G4waM6_Fef8mLlXZwtoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,quicinc.com,lists.freedesktop.org,arndb.de,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 788B744EA02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22-04-2026 21:17, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 02:54:09PM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
>> poll timeout happens, the call will fallback to normal RPC mode.  Poll
>> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
>> request with FASTRPC_POLL_MODE request id.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 148 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |  25 ++++++
>>  2 files changed, 166 insertions(+), 7 deletions(-)
>>
>> @@ -2331,6 +2446,22 @@ static const struct fastrpc_soc_data default_soc_data = {
>>  	.dma_addr_bits_default = 32,
>>  };
>>  
>> +/*
>> + * Older platforms that use default_soc_data but whose DSP firmware
>> + * supports the FastRPC polling mode.
> 
> There should be a comment, "don't add more platforms to this list".
What if in future any platform is enabled that is based on older archs,
i.e. doesn't use kaanapali compatible but supports polling mode. In that
case this list might require an addition.
> 
>> + */
>> +static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
>> +	{ .compatible = "qcom,qcs8300" },
>> +	{ .compatible = "qcom,qcs9100" },
> 
> Use qcom,sa8775p instead. See sa8775p-ride boards.
> What about qcom,sar2130p?
> qcom,sc8280xp?
> qcom,milos?
I'm checking for these platforms also. Will add if these are supporting
polling mode.

//Ekansh
> 
>> +	{ .compatible = "qcom,sm8450" },
>> +	{ .compatible = "qcom,sm8550" },
>> +	{ .compatible = "qcom,sm8650" },
>> +	{ .compatible = "qcom,sm8750" },
>> +	{ .compatible = "qcom,x1e80100" },
>> +	{ .compatible = "qcom,x1p42100" },
>> +	{},
>> +};
>> +
>>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  {
>>  	struct device *rdev = &rpdev->dev;
> 


