Return-Path: <linux-arm-msm+bounces-98104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJqSHWkWuWmOpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:52:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40C2A5FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A39E300463A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2881539C62A;
	Tue, 17 Mar 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASZ/MVVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCClEhJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07747386544
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737498; cv=none; b=VoPY4UYCwJ2/cjGfa++20QFxJIDU3zzYZ88Q+q9eFMMuUue1Uxv2DyxahI5PLK8Q+8pNlujiVUfLRgITbsiH+YZMPbr/NXmA9+3tIHIZBql2oDOVspVZdb9Yu0YtmwGYXCr7jY3sinrpyNxQrlFTs5DymLt0WemKTS7X7G+cqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737498; c=relaxed/simple;
	bh=4QgBtB8A9KYHumYiqPxwg3Mhj07QBFZK+AfRokd9Gas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKxsiwIIW0sXVs39N34hweZaYEncNnGx31YvnktsJu4rdYDLAZ0IkBEMYvPBaPab/gdCtFOwybSKnFITSuabe//jKhErh3scbhWTq/U1EUT3M6oWVFiYgALMRwOYOJsG37+FL70OqpJFbz7HAOxKr5zdEX0TXEtWFcnEOATS8EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASZ/MVVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCClEhJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RQVF2906089
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=ASZ/MVVeGtJMu1Fc
	XLhAANnTMxH1a/V03vG/LTkSxc0F4h1bFIMtAPhjCNfhnr3REamoVzaRvJ/Ifm5q
	DWpnOtIKVZ2lztx3+oTq0s6N3eKWOBuea9uI0iDZ/3DENDJ2W4IrKaTj0qitnYsP
	PTKVUSzhCM3E4DrZZcryCru4YuPS/gsXqVf5pYvK1u5TnwI4y6JlvXMSeP2McicD
	+oZUlt7pYG43FnWbT6wLNcih1Qj/3DZZC3c8zJFvrpMgtwdfF/FtCG5S9fRhbnGF
	JD5kglBhyIBwiy5g50f9b51gKOOlJnxwyhF91X4sV0+pn+xbASdGOs+h0EFSpdzf
	YmkcHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxga0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso19494585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737495; x=1774342295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=iCClEhJUF5Dcxya/Kwlwq5RgaYQDlrMdRhjSM+zbkfkNUe8Q2NQjwIb2whshr4RLRz
         i6uA5HNBYbSMy10DqSa+MIdei7aW41WMeE5kz6tuahZO8PY6AqxAkGURslGhd/5EeOty
         8wGZyJ01oDHlEn11oD3IYkpIaWH6PMlUJT4OypKjFfkOtGbhZSWYr0dV7NXE793GOa7c
         MQgjqV3WcrGq3fWPplXE9TwZHfbD9EUvL5inAKAaI2bCdyPoEpqVqrgmpz/lEfF7V02J
         qo81rN324pLXtKJRRPN1oUggUuSlI1CDATPlxnc+khQ4xSK4a6iR1vMd5wjHk0iTTZSY
         6p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737495; x=1774342295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=RHk9WLNTUPPF/1Jwk3N5rdcQP4cxAiOXFQrUF4LqezF1vfAshvofkMyp+GXDT/u1lP
         7P0c1yw1rVcgTOEOdZkqdSdFsYGgVEHTKBt/mqoVSwaQQZgAffDF7l1QeDO2s5rjIhSn
         exyDRKXuI0Ebja7buxvlYEy093G7xasrGJIOKGBIMOknpjzCws/IP54iZzwA1PzOc6s3
         2IR+BDKYeo/GWgNFsqydtQV1G8hS5Jt/Fxkl+NEHcEjsCwz6MM/C3m1XUwAMlX8X1qsZ
         i3/MCqalgX4uqpsEkSGLT4fv2CkYAF/emhvJz+ugrOOGAS4N7XCUdX6ND7pnr/rUsLPl
         If8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTV/rV1byxrWrxjNZFHimVNqRQySzJBwJ21HUxLrpA1+MCw5dGW6znNgaVYYuQptPu39oiRRD8YcMD2ZIb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZX2DdvIEaKtUefdtqadauEJqCRVgp/3kmIJ28bn+HEMu/Xr0
	tWLr6mLsEhq8z9P+spKWeDYHeHQiAgzsqIljbiSKmpsv96Uujy5Z50rYVTe7MtkhDY24rQpf3xl
	Qvun3/5jfH2MALMWNjwspaqeYTFHArWQMaOqXoSwlrPwJ50JszsNAP+5NJ5Q3/2jaeCEn
X-Gm-Gg: ATEYQzxb6ND13YdbjR8rh6/Byel3mW4mXlYL4SK8iCVSdOxaKz/FL0QoEblAjhT3Lef
	1oN3aS1N1Fn3I/U/oMU8AP5cdkwdarW/USeYdOHCdOVioXZrB83PM34Y67Y4xpJOQnmiyjgBHxX
	c01+dgAApO1foZG1jyVJkDsi4xbO30OMizAUxuVwxKTYEZwhvfBUSXa61JwzFhorH5u4bhZ6duN
	dhFcHS4G98CuiM27hr6oQ3CBvCi3njBwzILrUbAs82B4z9MFt3gHeiqepl7H6Q+UNRnK24ecRL3
	qxcM7q1cBtVmyuP0w20eFYhEIRlMU1troXlQG0Sq80t6SUfkT4CP6FRC7YsliwyN1pdbJnoUh+e
	kwzM+WPwDI+V1claKuH3DRkZchUGNFYMuM56HBWcEdGjrOzRYrdOiuY1hH/WpxwA9Ef+uXp9O48
	6KzTScBoPp
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966587485a.41.1773737495263;
        Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966583785a.41.1773737494732;
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm46732245e9.10.2026.03.17.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Message-ID: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:51:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Jakub Kicinski <kuba@kernel.org>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260316172251.2d57d0aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vxr7nIdq5VcuUQ27RliUEo5rjLFkR8uk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3NyBTYWx0ZWRfXz94+9hV6JvqW
 bWZ3I+IW3hiA4kxOuaIu3dBBR7Vx6cZ54wRvuhT1Gi75MwvzApiE0kpfIZjR1OLu2ZKBzFrGeO2
 MLqrJgkfBlmf3Sb1TTTr1UeWFukymVQPWI3ms4XnZ73WK7BPX6NgCPSKqz9PRpp5sKA0w7M0/0+
 4k85j9RjzOlNy09xxHV1Tq2rZsMbyRzK592+1kKrdazUA8fnFCpH4vkiUUkSSBLuqatIlrkpoOM
 OKTF0l1Jfxrxc1LtHhm2G0RiZXOeelOpj4BDiVWdcPTbGFiwvXHh0UAfItGc/+C/KfAoGrrF+I9
 n8v2J8dhpIu7NBbpKdwYWeORILzi9hD8Cs5MQ5bHSSkQYmQSpYDFjv2M64c+UCZQsqG5QoJcDLe
 ue4m4BL1QECbJuzXbdvEflba9UK1K/6wMpOVhLmKdu3/U2fvmL8Z5R88XCSmA+v26iKGmrrjvhS
 5GYN8zGddo0K2s5OBgg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b91618 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=rySjVtX6Rl8zv02YFYoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Vxr7nIdq5VcuUQ27RliUEo5rjLFkR8uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98104-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB40C2A5FA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 01:22, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>> This series is based on the immutable branch [1] containing the QMI
>> service id definitions along with some drivers using them.
>>
>> How a patch can be merged ?
> 
> Wait for the dependency to appear in respective trees after the merge
> window then repost the patches individually. I'm starting to get
> annoyed with all this cross-tree QMI/MHI noise.

An ack is simpler for everyone, especially when they are trivial

