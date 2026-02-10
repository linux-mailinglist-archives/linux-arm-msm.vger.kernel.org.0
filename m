Return-Path: <linux-arm-msm+bounces-92461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKxrNZ3/imnJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:51:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44036119220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F29F30692FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3EF342530;
	Tue, 10 Feb 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCNdJ21S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoIRPArw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8F5303C87
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716952; cv=none; b=mtswX0pfZXRNtnLb42EJTC+oNFHmID0O0Gg3sOM88Xn1eVokGwJ4kE4Plcsw9hFGofJmHi74czL9Yqq5Q3juwxjlpSCu8YdW+wOJUkSnGfsmZOWw1Ir/uVEJUg8YL030/SHbFX4IOkizn22H/JkY0xcnbZ71BDF9ZvQ9XbUZHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716952; c=relaxed/simple;
	bh=VWpPoeXCSkRUD9DKFsnHZPd3THYGbDy9Ey0YiEPu1kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7OvGyxs08MTA2A1PAZFNbjsOswn2gxTWee4c4tYZes9tymoS2qHPpn1GwTBZyUBtodbbBLlOeQe+oZXPUhjZoYdW2Q0KyS0KPcf5MTMTfkNwPHMoYNMTVJJbiqgKjkbU2lMJyPlwRF7oIivA/0Zk4EMbMKf7yMNystktJIUquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCNdJ21S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoIRPArw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53o01801178
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=; b=LCNdJ21SaC5dGGFH
	Cmh7SLjmH4DMrPdnHKDH2iWNmfV+qY1zHNy6YNlF0kB/CEjfmiIKVWpanqV+mJqW
	aq4ILYtSm2oyUC5TFtrtqGI/JbFrAgbQFaLTJjUdtx2SzRqABmaBfSrP5itNtf1I
	L+RdDnsYC2WZbh0mpafiuxf6An8a+MEyOMbF0ICPkLQnWwhwpGMhxR5CL67ZAWcW
	OtzC6g+HGasaG2N/0I4+kHdEeR6SRlFjyghIM5t6xEYP+uER6EOrgBcV5+EJx8n0
	w2GQcZPbh6Gd5vSCmCsWEfVhZbCUNIL422oS9oL/+io1Y5XfmkHpX1ceRELs7Z4J
	fCCBDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u0x7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f5c90f07so17188596d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716949; x=1771321749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=;
        b=DoIRPArwgy5Ffao93bAqA4tkQnRdd89eeeQjR4VhCOOY+JeL6hIVCJ7dTrM6xDOgex
         4+0TjW2l7uXedEAjdv7qGTk08L8tDh/jGfJESHXr9Rl+SQPBVnydEox1HQ6U4W5PnTTz
         YpKM08I4ziHcRwamqP8UilvUC7nkzbD7PYSgpH+9g/9dBXvy2LcRenPKQhs2XlqiPQqS
         Tb7lurnc90anvSuRZpiTuZ2zh8+KhDTjZTGduna7jRyuSN0w4UUIheKfzLC97w9qKcDz
         CSMDckqMHXIoeSxPuFnCdAUgi2j4aJhB16OPjm6wx9NO5T+OS8NEXYokAaJlBt4hC+Cv
         iX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716949; x=1771321749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=;
        b=a4UAxgIW0p1V7LONruRDguzG+OfZVU+0r0wnuhl6WaMGcQIjYOH+HiKaRGNuMvesEH
         HgwujEit8V+Qq438Ib4mQzoVUAC70e4gxXWA2zaW5feDig9TOqW9Glo0L5ur+E7njwZ9
         M2wGIsczeQlvUlc0s+xzSFyt65CvJY5L24yiyhVDw/UcRJLMyGFSNGOKcvkU6SK+8rd3
         rvepg25hO+43jorexGUS/YRTcfdpi5HA2S5gwmlO0PYsmDeXzKq3VAkTDAysz98KoAkm
         Jxs+8m4zJgVvWiYa8y08athz03oZ5T2DrXtE+DxAi6TIfxwFD9irR4WS9NKdnI9Bl/IF
         Su/A==
X-Gm-Message-State: AOJu0YxWYtvui8LpgqWdCe5rbkEIOSMyawfVe24HZ94ASEDCRNlJK5u0
	JYOlBZcMZrQjxqIXtlT5MlMQby2JD6somEJv+z4D6GSMVaBqJKtRmSW6DcC1Ik429CSj800WvLt
	aWHHClcc85EQJQnYSigAqz2Qc5oztHPjU7/GFumWl/R6re8D1jX5SKQJsD5fZG+Dt1NxD
X-Gm-Gg: AZuq6aIXFq7ydvNbFwGT7WQi2xgMqgTHysLKYRjlB6xkKy+6vRdEoa5YGaO84jJ7VMW
	kdMOhxkHDBHZQaBpI+m5hnHZRCNyhTXqql4D3rvp+4p6oHOGNG5pFGtB9qiH2/ogVKXZL1WQeVY
	AhhI/a+WB0sGhLBb2g8rvU0Jx2WeEw6EbmS9lElasCEh0nPLumDgslIp7AwuBcA1BAYJXtth2Wo
	x2A898Ah3yWCfQwRstNrTD7jHH3fBMbLWmPh/hYe0h69WZY6Fq+wOgX26MyP8yeKylYFcX2KNXB
	QWZcq8JnWlq4VvsVKAC+OxYvy63trbiL8t0o7yMCTB6592KszJII7NlSErqIwwVqx94cH8aDkCi
	pz+QG+S6YNcOs0w7u5qxunpw9S4IfVkY3120d3wdw8vVe2awRHGs2HHIO9bY2cHy2FJOMxfn4LQ
	2bCfg=
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr9201566d6.7.1770716948613;
        Tue, 10 Feb 2026 01:49:08 -0800 (PST)
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr9201326d6.7.1770716948250;
        Tue, 10 Feb 2026 01:49:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a23a3bc07sm93405a12.8.2026.02.10.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:49:07 -0800 (PST)
Message-ID: <7be60280-5a25-41bc-a19d-4e9c4bef0784@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:49:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] usb: typec: ucsi: ucsi_glink: Add support for
 Glymur and Kaanapali
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-5-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209204915.1983997-5-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5oAK9DWhLxSRvNf-QWzDSlKqm6DL5XX_
X-Proofpoint-ORIG-GUID: 5oAK9DWhLxSRvNf-QWzDSlKqm6DL5XX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX7mkBOGMC/lQ6
 Z3CcgNJH8KdyBZtYvuwkDENHoq7PKTiLBDnEnZOhUv5hGDHbE/zNuB4yJbkOd8oJoQ2GYMZd9vL
 estqCvEvZGUKEZNlrnZrJP+xBwWHHU2wnwgOEQ7eRQraPynPTiIAeGid95SQ+A1Vxei70J0WYH5
 POjTCBMc/pLiRSdZnu83gUb0gttEAnRzKzhtdd9LXGS29PSj7X/LP/aC2kYSlKtegfMZ4pYTo5g
 lrVXKj/T/mlxiCvRdca6JajKSu1+VL9+lFbaeCJxhELC2S4LU+4LZsmNXvj2WJ4q/A1HlyS3BWi
 ZpRXS+3ezvQf2d3mn3pRoaSva0Gqr0uZs8F0VwKg4yzNseCujwy7CisLZHgpCTgehlu3CmdMpA+
 MiwwGEaerUuF2m2laGyXCS0+pjHsqO7XA5T9Zi3LqvFphIhssgRdHqmUBU9C6j22LhFNRvAHgIn
 dq65FREF8QyI3AIvDSw==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698aff15 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=401012Ij_cZx4E-EtZUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92461-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44036119220
X-Rspamd-Action: no action

On 2/9/26 9:49 PM, Anjelique Melendez wrote:
> Add Glymur and Kaanapali compatible strings which both need
> UCSI_DELAY_DEVICE_PDOS quirk.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

I was hoping this would be resolved with newer fw, but alas

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

