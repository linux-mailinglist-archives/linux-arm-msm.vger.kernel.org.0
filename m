Return-Path: <linux-arm-msm+bounces-110107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GzFOtQuGGrUfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:02:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D095F1C64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3B3B311F8CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AA83E3143;
	Thu, 28 May 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0PebDQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSaRxZ0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAB3D3CEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969303; cv=none; b=RoyDrH1p/YvgXBXC7GXVVdc8GOfwvzw8F43fBX1chWlChzIzfoHDvgOuhVII1gRSOWlQyCgZVTsGNaZdTAzozfXp54hlVAF/PaeE3ApzfQyk3RCGD2ZkJ97RERZXIVS3l+tuxc1FxmvLzAp9C/xK7Jll5DHUCDMVeCewyXpSG10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969303; c=relaxed/simple;
	bh=ESZdAJkvYN+GKJn/c6N2sSmBuX0qgNWKfn+CcPsIkuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhRFWaYD/3irkUS0KuYFYwMP82HeDRpU+f6r2AJGebl2axuOPaYaiznANQtAker0jDHtB2PBR7wr+HGHL2J+eGjW//u3AFZXXQvLPaJkvFnATkwnhUwcIIBBAxqtnyo7ZeMu82Ik98tGExzKYEo6au8nFp0GxE2rLDnph72wfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0PebDQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSaRxZ0a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vNg73545345
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwgyWXl/wbAR1I0i1THed+XapjmeMAOQHW+lUWk4Flo=; b=C0PebDQ2V5/4638E
	JTnPHae4r49IccWGKPrq7STAqtJjbTaOeVJZHcUp7VzeHsjY5NEJIILjJl7XtsD5
	yCL3+680nVwJsI8EZHXOK9O7QfcJcfszTmBmQ8ko2oMpnzQLGc7mpaOZ9C55NEzG
	cyzKnLCwPdBIE5VrPP/mVXajQk6/NxC0Q2VG8X92YCAMTrhy1O0XpwMbHmj5aetj
	5Hz0IrJ4vEJky7+4AzenSgLUj2K9fq8SO7tlconxL2CMB+V5rxefRbkf5eMWN+Fn
	ymbYOAmTO6qLPMfqNWjnbOaY/u7UBb3IRDlf2KJdtX9d2wC5EYdNm9Py3icEQzA3
	f5JWlA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tkck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:55:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso81730555ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969300; x=1780574100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwgyWXl/wbAR1I0i1THed+XapjmeMAOQHW+lUWk4Flo=;
        b=RSaRxZ0arTI+iAsesq9XUhByNm12dpuTrotCiqq1zSfdJD59ypBI4/XlZ9RwP2HSJO
         5JSuMgNCmSFZ1B+RP9we2smMw+dsYxWmlnJ2X7WAy0Dbfl4a7z2IHd1XZzytob/i6T0m
         Jyr2rpLkkfy5IUQWayRH4npy1nmF0kfCVS5xuH+BZvktMP4UQ9Fwp6ecOHq1yRWjZo00
         QSSVm71wK8XStyuNotAL0JuKs52di82bVbMDezw/tF60LrWqO+Oua7QOUauxaX76UWkS
         ZafiwEdfTfNwmg/o6To2thBRmkOeeVXO3IvpJa1VM4Hk6ZvVNY8otbnaxFIux+l9VqQz
         SZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969300; x=1780574100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwgyWXl/wbAR1I0i1THed+XapjmeMAOQHW+lUWk4Flo=;
        b=DnyUrEt8IqtYgv60B23IMjgRHJBVIqD2lJHfQ1ycgodDsUyVA037Xsajkelx790PbE
         Gt9eJF/dsiTpq2yrANla9fvN/jJO3OrrdZsYUPp0k2tfjHzbC+cl6uqNStDsEkC3uvFV
         U/bN52TrcHaSu74wPBRJXh2MMGg3Qdb37WCAVppKBe/UBqZuyD/A5Jlh+SDMfnAGpWYS
         Y2dBfyzrk+hQtvIbSl5i9rsDcWKoQMKC8+mdzmuSRMCaVp56bzqnmCNvAtallz/c1/ii
         +tTdJv6tJekkZzAJi9NzY1HCDGDCMcoCIA6GR3RY2/pbVBK33mWbi5VXSTmuzoNH4SUc
         X+XA==
X-Forwarded-Encrypted: i=1; AFNElJ/X8bACNqx3e1WEjB0IQJ3rPpspPRjkFbu2LDIa+HuvELH66AVniSu5OYdCIOF5WGIdOz/CwN2WqTdu4nei@vger.kernel.org
X-Gm-Message-State: AOJu0YyjfiAAinNIgLCWkkIbJxLEwfEW4OIY5OMyEMSE6DpPTDbyB5CV
	NEgpnE8NFI/8UeUr6K1SPOecq+Tas8KRaLW2LRKlpYUWKUpVFNTd7PQroDNtzGjdiBXossQChLf
	3+PerjuhzpHZTR8ia+h5VmTspskZ0aFzlnN0m87ezjLOfvgExC7AzXAuHHeJPW91XzleO
X-Gm-Gg: Acq92OG6aAJPWstFv4ZW+dD6bhbQl6dapqFSUiPmRlMe5knpuWhXHKObwFiMwdY9mL0
	Yuklt/wCGBgnQ4kq5a0DPyJxrmFTsRpfIzzIg+ZW2y99IXgY0BN8Bgkp9VXEMDmwbe0j1F7Tu8L
	p3d0W7Xp7QpNIG3LLclgk3gTQXdu+1Op6g+ro/saEP5wppD3XnBO+SQRhvZEqqIKeug+2hZY9Ie
	aNPFu5564WfZ96Z3BZArmDausY2/Efkcb3FG2u6D+/+pGO5Z73oM/uFgU8b4gRplFhltjbQuXa3
	q9a05gSmRxCVjUyou17uS8+ojAqXqlBW4y34anm0s7kQKDewV/+3XqU0Hb8JUVSbqsCiT/cbMCk
	mLAUjjOepADwPD0ES4YbBzVcjbGzFJfreWyvDEItU6GTYZVlNiQfyvtzZ04kh
X-Received: by 2002:a17:903:1c9:b0:2bf:b17:ae3c with SMTP id d9443c01a7336-2bf0b17b382mr25105575ad.25.1779969300025;
        Thu, 28 May 2026 04:55:00 -0700 (PDT)
X-Received: by 2002:a17:903:1c9:b0:2bf:b17:ae3c with SMTP id d9443c01a7336-2bf0b17b382mr25105155ad.25.1779969299521;
        Thu, 28 May 2026 04:54:59 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.84.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf0534e4c2sm21854595ad.5.2026.05.28.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 04:54:59 -0700 (PDT)
Message-ID: <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
Date: Thu, 28 May 2026 17:24:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
 <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark>
 <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260525142843.GA2018@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: izcP2I7FvF4_M-k7qMSHW5946weAoN4j
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a182d14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PgCQwUeJFwcsjcK5ROf6Ag==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hyd54oqyHhkzJM2O_60A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: izcP2I7FvF4_M-k7qMSHW5946weAoN4j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDExOSBTYWx0ZWRfXwjyvD2vwrQpb
 tk2iIKWhGxRBwTSrx/YqE+QiBhsfyD89j7y7is9SkSbqdylJOQmK3I2qnVlqYRpEANt0P2CA/Kc
 EaLBnrdsfNyvI97lpNatT/ZqLtzth9TNUA4oKlueUagrUlZaJnU/pYWgw2AlQn/OpqWA1Aaf5wI
 6uyaM/A4dz9Toq/K7mAqCQ0qoH35pM/sTf2u9HZcvpybwTdqDBu5GBjmOjLYIDaCif42QAbJULu
 xP8MA6slCmSjm6aA+r8t9lQx+6Jy0jSRH5k/5drP92ZanxX1RQBWPr4zO14f6nnBMdqTPAuu8Vy
 +pzfL4o6u49s3j1RxxpvPyADCPBJDW7D7evpirweXdiHfQ387nikv9LZyYz9eGOP7kYCTADHAj8
 FyHfj9d9JlDRPbr32PNmRzuWH/Sd7WGaLOxU3FTLQZlmK7T3T8XrkFeK4G97tpu0Bcv4CAQeX0N
 /849QHkmlXA9P2mQlqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110107-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out,qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 73D095F1C64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> +Bartosz, Gaurav, Neeraj
>>
>> Hi Eric,
>>
>> GPCE is relevant in terms of providing hardware security.
>> There are multiple usecases coming up for example to handle DRM/secure
>> buffer usecases to improve overall throughput for secure content.
>>
>> Regarding performance, it's currently slower compared to arm CE but
>> provides an edge by giving hardware security which is considered more
>> secure.
>>
>> Btw, there's been performance improvement with new targets and we are
>> expecting to achieve far more better performance with new SoCs family.
>> Pakala:    GPCE - 550MBps, ARMv8 - 8GBps
>> Kaanapali: GPCE - 3GBps,   ARMv8 - 10GBps
>>
>> Please note, there's almost 5x improvement in kaanapali compared to
>> pakala. Though overall is still slower compared to arm but as mentioned,
>> expecting better performance with hardware improvements as we progress.
>>
>> Also, currently qce driver exhibit stability issues and that's what we
>> are putting effort in stabilizing the software on immediate basis.
>>
>> There's parallel effort ongoing by Bartosz to introduce baseline for
>> secure buffer usecases.
>> https://lore.kernel.org/lkml/20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com/
>> There's active development ongoing and i believe lowering cra_priority
>> for qce is fine as of now and can scale values once qce becomes
>> performance efficient.
>>
>> Please share your thoughts. Thanks!
> 
> ARMv8 Crypto Extensions are "hardware" as well, just in the CPU.  They
> provide constant-time execution, for example.
> 
> Granted, they don't protect from power analysis and electromagnetic
> emanation attacks.  Does QCE actually provide those protections, though?

QCE doesn't provide these protections currently.
What i wanted to highlight was there are certain security usecases which
are possible via dedicated crypto engine only and not via arm cpu.
> Either way, it doesn't really matter in this case.  There are multiple
> aspects to security, and before even considering these advanced
> protections, the basics of security need to be absolutely solid.  That
> is, the driver needs to always compute the crypto algorithms correctly,
> and it needs to be completely robust when fuzzed by unprivileged
> userspace (because it can accessed in that way).
 > Yet, this driver "exhibits stability issues", fails the self-tests, and
> doesn't even have exclusive access to the hardware!  These are all
> security bugs.  That very much defeats the claimed point.  (Plus, due to
> the performance issues no one wants to use it in Linux anyway.)

Sure, we are analyzing self-tests failures and are committed to fix any
hung/stability issue in any aspect but i do feel it should not be a
blocker to add new soc id support.

Also, could you please elaborate more on "exclusive access to hardware"?
Do you mean the hardware can be accessed by multiple execution
environment like TEE and Linux?
-- 
Regards
Kuldeep


