Return-Path: <linux-arm-msm+bounces-105643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGjsFjpC+Gn9rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32014B9059
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F7563001FFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 06:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B912C3757;
	Mon,  4 May 2026 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Knhz77nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JesfuVTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9928E2BD59C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877557; cv=none; b=OHljRO0Lqrioo27WAG/DpWku53XnLO3xuX3dGxd6kTL9n6+8/aij0kJuc/VmMitCtSDIGSN+5BFpYLKhlNreB6Cm15CHh1gMqk7FTCvzEOYAfmy/Hy+fhUKudcCBCPutw/qLCgAsa6DFGFG1bWtbuKztRy1/MU41UtliWyRAtdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877557; c=relaxed/simple;
	bh=eela6IqwWByFF0zNF6QNmsicVYeSk74s1XZMlJpdnBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqr0su9jdoDH8RtgFSUDs4ramDnI4dtbL7ZvjCnsByfbe3VyWTAH6ybjK8/pFIa09rXkLghKKDJG0czlaShxHtSXF7BWEq+tIudAqBLekY5BVdaGyebTzYWTFJwfWZUD8cBAZEujgSGoqmyVUcQbE3rHE8ENVQeEQrVGpBAIcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Knhz77nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JesfuVTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DC5b118457
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pw+QGNnD2aXDEvze4NDnuqATbVP5Mz7Pd3Jir1xluBQ=; b=Knhz77nub5NVmsev
	r6pOeYc8F9YwhbJNYoqJK2yWTBREnLWN3p2cr8+VXj8mhmgw4TeOcwefDMnahQA2
	SKMF+rn8M7u47PZKJdg0UBEeCjMF6qSygnFJF1Vpi0HNcSrEyjQYlFs/Fz+nf12B
	xb5xZWxcnBrqZkc2nFHolu/NdWgypSyeOGwyxWW6IpAizir5uPyfdqCAFfC4Mafd
	92oByUhnGHCh9EA9I3POBhYYmxFP6HH0zAiHid5ZbHw5pnn4cIl/0p1LcszXSUaO
	ktFnufIUNGCY9IuhuZd5oh0/xwy4vbBEIF1FUi0AopxBjTW7jVP4UXS6I/G64iF9
	uTiTcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejmj00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:52:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b465bf993cso39493735ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777877555; x=1778482355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pw+QGNnD2aXDEvze4NDnuqATbVP5Mz7Pd3Jir1xluBQ=;
        b=JesfuVTCfZvoEcML3g4obXK62RbvQPmNI1Kr6tbfGsEdk84iVCsLZzSMrpslMAHwy3
         HJN5gOm+RtnGAngdIdWRAT3dIMNkS07KBdAGDQk0rFi83ILqlKCKGiqhVl3GuLM4gBVH
         b5WA8tsRWJyL20hOyo85hsu5TxdHzkE9qirESTq6eyeUzLnGbxlYTdKUwWb42HpYeyv6
         r00PgIfbyO9DWMqUn7Tv9IkbZGG+fvgDCCPmPKCi1GKLdNjT7O+P9g579HjZcYrzvoX1
         NNjmXHluNHmXnY2VJ2AvBEjG9qrVfNXqby57p4qUBseS4rh6IbD0EB0LQlYQMJK7/M8y
         QaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877555; x=1778482355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw+QGNnD2aXDEvze4NDnuqATbVP5Mz7Pd3Jir1xluBQ=;
        b=ZW3jQQM9VJidFMhMjq5on4cp14AbNV8ALVX97VYnLPMMJ5pnRet5t/whdLr/mw4OCG
         k04Jc34lcNDxT0CEWWCUC43JahuHTzBaH9hwYTW8WJSpGzO/DeA+G1PCO43wDdOdkz9t
         OKOx+i4svuKhyU2fltBA8FsalSEj61ZTGbvQly9zp8K0FKiK6nQ5aeOueuaEdr7oDRWn
         LR/31ls1YBEjXvD0IFMXLQ9VVFT3DL9UWWkzKpBWBZh8wu1/l4vuvZd1err88yXY5o2l
         1WrsHXplbgXEaJGxxtmnXxP2L/Cg+Q0BbzmpW/d+MwMz1+946vHeL2Nca28xxmxUuz11
         ILGg==
X-Forwarded-Encrypted: i=1; AFNElJ/nvLnd0QBK1GhnIcZ/WXMN1IOQ6tJPfKc0YPOsXYqrejZ5jmOOOiaXfumiIC6+qg2FHwt5tF2IYZ71pYIO@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAvzhQ4Tdvg1y9CxEKsCb5E3nnaug7ilPTv/AqrbbZe3Spx5D
	BnGgXV30v30lJuNrBTnaE4N+YVTYhl5akGxAd570urcmu7hfcw+rU1C1M4NDj9MpTgE/3e63wor
	TkI0REFm7kiJ8DCMjgEzLhv3ec/5CF2wlcGpD4fK02/a5xioAsQM1CNZ3tyKnS+tlNtU=
X-Gm-Gg: AeBDievOLtk3qCAxsftm9m6DmAXmSznX6ZEud/AHEGKyOetsIuurHPVeePsVd7vM9sm
	IiZz5cexqMzsF6ofFROAMA8QBLMVjhSdXzirf1sWttBJaOmRMrN4c9f4i2UDV8GeHe95aC05wP9
	NE/ZQvrvM3fjnTXgT1wbG1Br9lGymDKY4QnM8wUI8LDoYrDs8L/kerPCK7m7pAh/hjNCp2grNms
	pjLcFm5trU9gibrEOwKTAHfXz+Gunybzsd8zRyAHIwe58W3vBUzbtWy9SkHxxn3HfUXZfTo95oz
	EKEkvGwy7AUqsL8hPNkBuC+9RNtilbFgPg3os9vtvi8n4Uf5hNGYMi1PFvzppUBiGYw6VzhX+0Z
	aeT0i/Wj5pxkvx4GbJgtt3zbZ2wJDDelRMNzp0H+Htu+U/zUb0IMcxoKdCKiKz7/FDSZWrJlRga
	xSTEYvp7lqX3/LOQIfTiIJ/cb/pXs1qQ==
X-Received: by 2002:a17:902:ce08:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b9f284e08dmr89328615ad.38.1777877555126;
        Sun, 03 May 2026 23:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:ce08:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b9f284e08dmr89328255ad.38.1777877554527;
        Sun, 03 May 2026 23:52:34 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm93849295ad.7.2026.05.03.23.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 23:52:33 -0700 (PDT)
Message-ID: <e73bc74f-ede9-484e-b171-a7bbdb2c7c21@oss.qualcomm.com>
Date: Mon, 4 May 2026 16:52:24 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/11] tee: add Qualcomm TEE driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
 <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-8-520e867b3d74@oss.qualcomm.com>
 <ljfhoo5o45m3t5fsqypg75c46qohvszd5azcqxyjdcr5unx7ob@vcgip4yzkmmn>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <ljfhoo5o45m3t5fsqypg75c46qohvszd5azcqxyjdcr5unx7ob@vcgip4yzkmmn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3MiBTYWx0ZWRfX1oSM+PTeC0vY
 zyDSvKk94mKkPN69FLkYHqeJKPEAuLaCIM0/qYjkUiNKVbIIklmgBGmFiJ/2A/PFfKEt+kKTlDN
 iLic3TE4rK3vhm0HRd2FLUjBTP0CIKQa8wP3XXdOHz4+fYrlCit5nf0cbq8yzLwBsMobFdkfFSm
 iICffGSYLjehJEYAVQm+fSFaFzOpAz5URJPzyenqnk4RnXAhHvhW/dKsziB7+0OAgSpCNnxzrCL
 4Bul/PQJf3VKhFTsXthafCYzh/1SrS7HsAJwwOstyvipzQYLwj08fsxJnDiHPJQyXmOpRiqn1iE
 YThkAwYgQDVN1bhrSO6DDoRBUdJvUub+MKAkME6wWHX9msykHTsTiefXTamWAeE6huN1sBUq2Nz
 x9P7dIBAylPLPk/HhnSJs3MSJvycxxpw4zeGmoWKfYDyGbHqlq2gyEBVnIh7zMdRPGIMZgftBsK
 WVkiRTJuok2XKgG2Rkg==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f84233 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=t0CO8BxZkIs7AVVQ4zsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FSdalGAyVz9X0sFIvFXJ-CQ6BQuiXLvU
X-Proofpoint-GUID: FSdalGAyVz9X0sFIvFXJ-CQ6BQuiXLvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040072
X-Rspamd-Queue-Id: D32014B9059
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-105643-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi,

On 4/28/2026 7:21 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 10, 2025 at 08:41:21PM -0700, Amirreza Zarrabi wrote:
>> Introduce qcomtee_object, which represents an object in both QTEE and
>> the kernel. QTEE clients can invoke an instance of qcomtee_object to
>> access QTEE services. If this invocation produces a new object in QTEE,
>> an instance of qcomtee_object will be returned.
>>
>> Similarly, QTEE can request services from by issuing a callback
>> request, which invokes an instance of qcomtee_object.
>>
>> Implement initial support for exporting qcomtee_object to userspace
>> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
>> through the TEE subsystem.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                          |   6 +
>>  drivers/tee/Kconfig                  |   1 +
>>  drivers/tee/Makefile                 |   1 +
>>  drivers/tee/qcomtee/Kconfig          |  12 +
>>  drivers/tee/qcomtee/Makefile         |   7 +
>>  drivers/tee/qcomtee/async.c          | 182 +++++++
>>  drivers/tee/qcomtee/call.c           | 813 +++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c           | 906 +++++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/qcomtee.h        | 143 ++++++
>>  drivers/tee/qcomtee/qcomtee_msg.h    | 304 ++++++++++++
>>  drivers/tee/qcomtee/qcomtee_object.h | 316 ++++++++++++
>>  drivers/tee/qcomtee/shm.c            | 153 ++++++
>>  drivers/tee/qcomtee/user_obj.c       | 692 ++++++++++++++++++++++++++
>>  include/uapi/linux/tee.h             |   1 +
>>  14 files changed, 3537 insertions(+)
>>
>> +
>> +static int
>> +qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				 int *result, u64 *res_type)
>> +{
>> +	phys_addr_t out_msg_paddr;
>> +	phys_addr_t in_msg_paddr;
>> +	int ret;
>> +	u64 res;
>> +
>> +	tee_shm_get_pa(oic->out_shm, 0, &out_msg_paddr);
>> +	tee_shm_get_pa(oic->in_shm, 0, &in_msg_paddr);
>> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY))
>> +		ret = qcom_scm_qtee_invoke_smc(in_msg_paddr, oic->in_msg.size,
>> +					       out_msg_paddr, oic->out_msg.size,
>> +					       &res, res_type);
>> +	else
>> +		ret = qcom_scm_qtee_callback_response(out_msg_paddr,
>> +						      oic->out_msg.size,
>> +						      &res, res_type);
>> +
>> +	if (ret)
>> +		pr_err("QTEE returned with %d.\n", ret);
>> +	else
>> +		*result = (int)res;
> 
> After enablign QCOMTEE driver, I observe the following error during the
> bootup on RB3 Gen2:
> 
> [    4.720777] qcomtee: QTEE returned with -22.
> [    4.725251] qcomtee: QTEE version 0.0.0
> 
> 

We are using the RB3 Gen2, and it successfully reports 5.2.0 as the version
number. However, seeing 0.0.0 is not necessarily a problem. What TZ build
are you using?

It's possible that the service responsible for returning the version number
is not available on your device, even though the object invocation itself is
supported.

Are you able to make any object-invoke calls from userspace? A simple test -
such as running the TA diagnostics tool - can help verify this:
https://github.com/quic/quic-teec

Regards,
Amir

>> +
>> +	return ret;
>> +}
>> +
> 


