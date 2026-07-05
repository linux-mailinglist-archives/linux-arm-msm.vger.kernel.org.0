Return-Path: <linux-arm-msm+bounces-116534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDeiLUQqSmq3+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB68709A68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A9iDBty7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CJUVZ+2u;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B410300B857
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A1638D414;
	Sun,  5 Jul 2026 09:56:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9058836C9C2
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 09:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783245375; cv=none; b=lBKSWDchahFGuCPL2JWXyB0M6wznOvkIwYvJDBTNVKxX2xKzH+VidpuIIfZTZmJgTaks1gVGUwuhdD4yzC2Wkyl8ChIrrlxuLcXPWRSzpIpDVygsDQPELQkRbHO8sr24Mds5gC0C5QjKTp3gtpuEaIkiwx1Gahi8ntOeIyZk4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783245375; c=relaxed/simple;
	bh=wZydx+D7+eV35VMeFKNwwx7xhnLkiOd3Pqlp0spAh7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eubiw8GxFp9PwwerC13JSAFzMBqUaDtUUmxMlGEjQqVshikBOVblwiFokcAOd5dtBncRH/rTIAnDQl9qy591mlhzRiRF1hrwHvLONCHnol1bAofbYXKeeUxQj9k0w+WlBR/2KyV9wdNUGMm3shUWUiBVSrtCqxNIqwOKEmJy4dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9iDBty7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJUVZ+2u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Mx2WM059935
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 09:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=; b=A9iDBty7BwcCDgrj
	obxijsZW+M/rwRFDYVUFQHbhkEGOAnuqZKGsmTsECOmKS0FE3CMI34EozXNGIj87
	JTJ3+8Y8fSYUulkLXd1+XCs2pLHfeinK+1WNL4mFq1N2KC9kVL50y57sCRC8q4XN
	VzR61ed9eubtEoLHSR2VMDCjwx2j0NZOHGSqc5jm5ATOdLlOl2HrwbKVldezI4mN
	lVj0om/3jtfUweFUBRWNkffYepokyQLdp2LcmIAVdmu+T3uEyyn9GDe66xY8gB4L
	LWDK26qBspZoYBUizgT6+CNvsSfK4U5EaHQqzl8JtCsj++rqQSQQwEIS5l1rHwZ2
	IOnGhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgtst5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:56:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so20373565ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783245373; x=1783850173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=;
        b=CJUVZ+2uxVk/eg4IpVjDHAbXkmcXGPho8Z5LK95PS+7M1bDmO+OXc1pb59wqlGnmHA
         YzXYwkEM8fizoM+H5PjK2AUhrUHf+1MGdbokjCSEgHR06ubdDwHedw+7k1pC2fomp6tv
         bC4Lj9pwQWXDP9N0ywL04U6ZZc57ZV0qaSOUZFBTt580tmYsCk8pIu4GA/lUULyXjZFs
         pD7cpDeod7/b60SapBgI8WidB9QmswVqjlkzksPF88ARPd49O+5iiBDkzOSpllT30HZ6
         8Z7IYGsmGKRYaYh7ra6fKaCa9XYtR4WpDlZx3Lx9J9/1st4wBVq/ScRx6AwNvGdV5oDU
         F6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783245373; x=1783850173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=;
        b=aeIJosZ78viyLuMNQKysnCGkzzuuqKQwjppmyMlH6KfGcQJBZH7z9KirVLvKjrsF74
         lj4CygaZsH9UyD8+t5iSHTjtPyCJMdtFzyTUR3g2JR5uXL8PgMtxu0BsgVPIlb8Ko7CX
         qYdxnC1aplaf0vUWuU2v0zk59fsMOh3YbOSxEWJOPA0kDcuWk8Pt3YW86RQ124EvQzM9
         4EWFwqunb9h6sAUiVqrykSWBKFkF9yJVcYGhTWNhDAF4ZZ6gfrALsqTwplrIV5t+99/e
         kfZjY5W/cV2GGRJQrEAUrGmWDI6flS/zsF7Acu8PnZFiXr7bc54XECJ0Rb6onaeg71v0
         IAqA==
X-Forwarded-Encrypted: i=1; AHgh+RqVFG3tSOH/QY1bbBsClTINegju0RJfk22wzBiL7yYNtlwD/U8YeLkkgOVbuVt9sucGgsrC6re2KtHtjeo3@vger.kernel.org
X-Gm-Message-State: AOJu0YyvLp4GGgforJsUmyTekayReEXWcahQmMRx5N9SF6IEatw1F52A
	nmlzmWnXZX7+FzGfpEi0tetvOzvYhyxwvomv6utPOr2ZJgAkrPeQTrPbIH4u6lKS9tJVIt0HlYw
	GiBLRw8tlvWgp/7hMv40At1KYWNLP/X+o2mV5J0JmqVg4AlycXWzTnNDv8vA17H3ac1Dv0GLbxB
	hX
X-Gm-Gg: AfdE7cm95Ie50WwRTJ8G/7oRE3YqP7n12LoTZ1e207xnyY/Sj/vpUwaeUbSlXXOCcvH
	v7sE9nxqbIN9VB+dPXBz3yyCnQl6OOAUtzJcTx2UQfb/4nF1xliRzrCDtsMTmDGBvncu2ak74Xa
	gp6SiSyPRx5cSVxgtCOMbynesvhewxGp86H8coo/X+gG+eFwPHzdYZ2x/jnf0884kcg2gDRWXEP
	DxjBXk1l36WrHA61YiezTLBKfJZ9zESDeNfqlF6aZkVGDtSIHWtwx/fPHckT4ZhTKSGy5QsBdwe
	pxzumsIjTc+vtFmxTyXd0E9KBXn5WjoJorM6iXJ5Pz2tSVEmDqw7B4LYLmuOSnFP6Rq7+8itWrd
	OBW8LFGCnS8qgTafz6dwOmCAVOziu2u25WlSakfJ+FA==
X-Received: by 2002:a17:902:f78f:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cc9763eb2cmr2053985ad.27.1783245373103;
        Sun, 05 Jul 2026 02:56:13 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cc9763eb2cmr2053695ad.27.1783245372660;
        Sun, 05 Jul 2026 02:56:12 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm60691241c88.10.2026.07.05.02.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 02:56:12 -0700 (PDT)
Message-ID: <6383bfc4-e193-4eaf-a44a-b9a0233068db@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:26:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-4-3882189c1f83@oss.qualcomm.com>
 <20260703-accurate-feathered-mammoth-11eaac@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-accurate-feathered-mammoth-11eaac@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a2a3d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UwBSoYOfm8cr69mLPLIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: u6R7aO0iJfiw4ocgWVRW2qDllhureocc
X-Proofpoint-GUID: u6R7aO0iJfiw4ocgWVRW2qDllhureocc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfXzdoBjJCtTKVd
 grzHDKokezEFNAo786G/l19p0rHQ/exabZxcSDhg6j2b79ejmCjWeb032Zy37LKKvtExBaiPU7b
 HVXW12Mhl8c5rDP3GMM3cofLts7a45s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfX2TIXtYnlFJIt
 MK9oZjW+syPwOc8iVDasWqZxw0nNnIntCcEBhzmBXFlAXpqv3gDQZMOATWcZFfo3ePs43Zmy4wJ
 Me259l0gCX07v4HVp0vG8jNpFpqkbHkMxTyU6hx3Xna9YSO9X8Z+g0KP5qiyG/Id04dwHaXmc/h
 Tg4xM+JST1DLmEIJvnVUMj9vnSe/iIwfoaDgtsPJpC72KeavUojFnto8TcCyrKgg63elOgsBUew
 UvLgHXjG2xMVe38Vk0AZr1YHga2A8AlJrNYOX78TXlGHtulhVkdxAlCzP3lZvXsesJqDgs0D1Cn
 EiqZ7f2BHi4kNLOHB8PXF2hjJnhAbGtPONWvtq/Ev16Ef/MhXi8WngDKVZDP7LFSxXMmYYJ1xPi
 BBdPaCwYSYMoMOS48y5YPfzOx4pfxLi/XXvTNeICfvc5R6QugcxfvLU18OtjF3xHSna9Hkehlre
 M2DNxn78uk4EWjkyoEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116534-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FB68709A68



On 7/3/2026 1:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:07AM +0530, Gaurav Kohli wrote:
>> +	tmd_inst = qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names, desc->num_tmd);
>> +	if (IS_ERR(tmd_inst)) {
>> +		ret = PTR_ERR(tmd_inst);
>> +		if (ret == -ENODEV)
>> +			return 0;
>> +
>> +		dev_err(pas->dev, "Failed to initialize TMD: %d\n", ret);
> 
> You already print error msg in qmi_tmd_init(), no?
> 

thanks for review, this looks redundant. will drop it.

> Is this probe path (looks like)? If so, why aren't you using
> dev_err_probe()?
> 
>> +		return ret;
>> +	}
>> +
>> +	pas->tmd_inst = tmd_inst;
>> +
>> +	return 0;
> 
> Best regards,
> Krzysztof
> 


