Return-Path: <linux-arm-msm+bounces-99236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FiJG0k1wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:42:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBB2F2186
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DBB03095312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8DA3A63EF;
	Mon, 23 Mar 2026 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar8ZQO0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6lF8Fib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086423A63E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269372; cv=none; b=Zh+ULbPuWO2bnDfrpRhuv+LkBRA7AEokfeltI1Gjj9jcjiAzCk0ld6avXTK86Ej45jY4gZ8U534iWDESPQupTNxc0xG8inPa6o0wMhgYw0jXcMQv7e6qeY60p3HFc3g/9SouihNWhUnxlstXOBuioOkCuLEeCxlHyFIKM9lP5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269372; c=relaxed/simple;
	bh=qR9lNg1sQ3u9U/A+p2688KwxIm0+L9Mw2pdv5sD+0Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2I1kMairinGfGVRl7Y7VkEoDZw5kCEKjypsTRD9oBzoyhvxCWsqKukIWVtsnxRsQceBfuttLm+yH7SyB7t/Rc/0qG4evLjGGkeiCsByP4ZVmfTJA/tX8lFAfJekhkIhJ0TInknF6JPq4/xFwDd8ULpnZOaNgq6jZ26IPrNW1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar8ZQO0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6lF8Fib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgImi123193
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=; b=Ar8ZQO0Wl7BlsjXo
	JNRgvzIGh74vir78+MgVvj7XYyV4+NsxRdUhZ6Gou1Xq3uIfYb1eK8O7w9j3Liaz
	OJu9COFfxJ1Y5z8p6MXQAxXELhCCyEYhlAk3LYKzKLpR69cq47LEG7UQaYEyQndr
	WRjZqIpemyFbfJ3WI0KvDEl/Ni5rtlr6zKkQrAzUlm+7g07I2m9R17qn6TJqw/V8
	fZGwDrGblv0fyZHw79qCqQPSpnJP6+alIy5UP4C7r2MNjf9fxKulREp/qxFvFu1q
	A/tNluD+l5PiHpxw4c9TEqD1tfXUh0JigJK8T0Rb+6YjacWI6ETznlzQaNEWFp87
	sA5Iwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkr5fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:36:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358f058973fso202497a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269368; x=1774874168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=;
        b=V6lF8Fiba8W957w1RcpB6g8/+C3qMMTLF64RjmmuJcbkBdV0VSvfXeZx7cMoqATWin
         FWSoA9Ole2fQAPcYgCO9K6ag17Kivq26Mz3Q/WSdPe9nZljqRb4fuEaALlAz0yz/8vdm
         VJf1HgpekMWFkO/Reh6ZE8StnFFrUPz2h77gFlZNaaOoIDTxP4w9RxZRtudpLaZacAjA
         77B/0lp7Dv91G9YCLmcxyq+YVxiPEgTqzzfX2o2EPiolgUVqrt6P2H21ymXfRkPd+gHU
         eG5XJBUcoqfnoltLGUQctU8UIlSGV0CZrYCCUdHYSwm0CtXmCnK66hM+2YWoo9gH7pMQ
         CRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269368; x=1774874168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=;
        b=EElfxIrDkpxlKdqrEj22faPxL3kTANag+V1zwC+NNDahQX5zVgoVJKvrPnQuh12SN+
         pJit0F3D080VF1wq8skuMBxZRB6dU4R0stsHsjRgqFbsw6QwiFlGAmaVUSgVd3EPUOqS
         CxmUBAod4lqzDPYTXLmLxOCZwmB4oXgcCRVA+e6sF9OwmfgzfZAFACFy2AdNIVxapjrx
         9ABrGlUwB/4xMizxi1+z4s3sEmTl/gIniyWQysHwzTHMLQfy6Goo6NiJpAjsYdrKUuxe
         BO6qcy418CkAYkU3n1pxJsEwQzCn8gRQ4XgZgKfEjamw7bYrRNf86mMetIN3WPjN9Gm9
         pY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmRGtz5feZSTrscyWhJ9fQw9XLA5fPyphSJDuTtFlIpsYU3KIaoWEmzojq4M1tA59CuteGSXvJ1OUWX9Fl@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSSVzIZBnbDIj949Qv2u+/TIJKbjztONR3IMxGcisxBLn/mUJ
	yQ68/p95aNvQtUxC780vZ8VryMKCjZkQA9jql4elgnRgc50KVEzXN23E67io+TlWhtgyg9ye8Og
	vLjeEw5sgLTxBgIvgfDM008zS8MCJ5TOYGgxTLytI4y/MehMHJrkcdBFq9W7MALdJC+E1
X-Gm-Gg: ATEYQzx2W3JMdoWN6xqR0wdCxqNQeKY8LkcolPrdzfPgXokQcv2gfOTg5ts4UDfjQCg
	Rpq+piSq6HIc/GVu9ad4gXh8fAIFZAwUcdMp3Cru5Qe1fCJ1EnO/2JYvr5Vpd6S+JQ0suJEj/7e
	Oaj64P4m4uxhd547SU9VkeeTZVj5OEdfxlU0Eet9Z0o+TTVg1sEGbBzd6synhNtSPK6fHJal6JR
	0RNoe5Vn4M4nbkHanmehqOsayZDJoDKuV0RMlm4ibPPnTHehKn+wY18SrkUNAGiYPLAci/CHx0n
	86ODzGMsTL1T6HJ160ZC9c+CN1p174fKOdyp6cvEl3PUpGrUwZtUj/bGvnjWD0ymLGmkGmuZEO3
	CZlx66y5nwI+1jHJfWMFQca70wuf3GliuSr5BPJkT+6XuSMo96mI8HuvPPiChRvA=
X-Received: by 2002:a17:90b:3d02:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35bd2bbe310mr9718525a91.7.1774269367680;
        Mon, 23 Mar 2026 05:36:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3d02:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35bd2bbe310mr9718497a91.7.1774269367020;
        Mon, 23 Mar 2026 05:36:07 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a801b79sm7520948a12.3.2026.03.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:36:06 -0700 (PDT)
Message-ID: <42b80288-5a3d-454a-bc1b-c80bebe2dd03@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:06:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Enable UFS for purwa-iot-evk
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
 <lmmlmpu7h6rm5ddi6aaspayhaibeyr274xjqqquaxtrovusnps@5p22xw3vcbnk>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <lmmlmpu7h6rm5ddi6aaspayhaibeyr274xjqqquaxtrovusnps@5p22xw3vcbnk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfXxUAOvpS+BGKT
 Zl94DyGugDmSRgLC5mHn7dg6bKXbWgyBy39K0gbdzqz13FVqLy2bMq4/R1p/WUvAmUc6Rkw3PWn
 33QO6apSG5GG5dIuqswcIcx+ECNbWMCAOssj5vmGdjA0rsaZGHgarQG/V3zxDlRkPaM7ucva4Sm
 ve9vaZjAej/xVw0hkGs2cOW1fAB09ZWi25O7IQqMjfihuqIPZ9Z6R0TpHSR/ZJWgkftXZ6rvH9Y
 8sDTmQh/qcpg8PRBiVn4tgoLm9VPEHg2vEKpfZjXehhFxO5LWmjN1yiHtcFFZWV0tVLTOJu/45K
 Rs6qQDXC7QDGjaXkL1VAu1eJ5Uxp40zXFg4fjda/XYL0LueVwNKW+4WuBQl2e8/x2RIWFEQMRSz
 K+YS0H6d2emoBe0+42fI1jKT6nsglXnFndRDKIY7JnEtY13V2TiQ/TZpnDavoihx/exE/KPr4Wd
 IpQdVVINjIisigEQNNQ==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c133b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X3-CQwcXODtUerY8amkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: B7LDfDekjjzDd7WtdaLck4ex-97NyBYn
X-Proofpoint-ORIG-GUID: B7LDfDekjjzDd7WtdaLck4ex-97NyBYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99236-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19BBB2F2186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 8:17 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 12:43:10PM +0530, Pradeep P V K wrote:
>> Enable UFS for PURWA-IOT-EVK board.
>>
>> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
>> nodes for x1e80100 SoC
>> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/
> 
> No need for the cover letter for 1-patch series. Please switch to the b4
> tool.
> 
Noted. Sure will use b4 going forward.

>>
>> Pradeep P V K (1):
>>    arm64: dts: qcom: purwa-iot-evk: Enable UFS
>>
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> -- 
>> 2.34.1
>>
> 


