Return-Path: <linux-arm-msm+bounces-90724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG74FqGbeGlurQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:04:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C3934F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E28833014435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4A530B527;
	Tue, 27 Jan 2026 11:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nW2gsptQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U20RJlKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FD30B513
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511836; cv=none; b=YuHvR9gaAIwVp1OWkaFFzfyoCp3MZ6SCx2EKp2XH6ZKyZLH/w/23rzjx4eI51idFC2swslXEkKmP7FnE0Gqo/YKFFDVC1FE3TAedjnHY6Fxtd0vqjuSC65dKC1GvbmrVtWTWG40eKFTET2+Na2jT73C28RUU+WhwxIKzyjoHT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511836; c=relaxed/simple;
	bh=iBCY7qOgjb/BvYY+7R0cdnjXBWepr7FXmN50KgQr2zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTyZwVQ6dtwgkQf02N0uHaMqxUuoQyy8W4TJD1CocKnh12f34OCTTOoRSVSdoZttGjxwFGpnlJ/RwRjGrRnjtGTnXn45Dr9nL3WpjmZpeCoLfAdmSv2cOv7EfSXcsSHcuKgdnNS9H5t16XNTWNq+HndpAoNuvtM9p9HF62ws79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nW2gsptQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U20RJlKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAF3Df171521
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HDg93K558bl2sB4IRlaeHit85Z4PQhKJls60teCPJg=; b=nW2gsptQ2T6jeujb
	xBGcMZgUn2wg6XPW22K2EXbeuujAodQxoUm/VOyQ4leBNNzWzMQlr8thYoiDPimN
	AVWxR/Tb0rJs5LC8NsIZpqgc6Kwi3z+jI12lZ3yN7mSgHgOjZP9Boa/Rd9ifH8Ad
	xbMYkqlqpzfAOPsxrh7sJasmscB+VmGKkRdm7JYqdtLtFOMX8jIGM/xtyMpdzqwP
	F9hfaGprY2ILt4Eo5bVVFMgq3+Ac8A8yQu5c8BUXeR0shSYe+X8y0MJSbVsL47su
	wof9urh/7VedrV7OCVr2Z4xnbTGWJ9yEAGgi09XBR/CFiATy4e8bFk1Qe2HjrNh0
	hkM/tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2haa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:03:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014f383effso5972101cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769511833; x=1770116633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HDg93K558bl2sB4IRlaeHit85Z4PQhKJls60teCPJg=;
        b=U20RJlKVmttzP6OrKr+p2WXZ9vrA49QfjyAQCSkR++k9WUQGcLM+r5w1iPPyM2Yn/C
         kjB9Im1Gf6/NQPW9vme9Rz4dlEjdFbAwJHhwd7F4aM0atp103Pm770V+OCuZ+dMC3Zha
         Lmc0m6wyzkKwv0QO4ze/l9TbIA9+JT7MO7S17ZuhVBfLu3eeBz4IYV7iQCg9IEchLguq
         y33tXZMYhLSgw/SI8FvrZUFC+PNkqvbdCLHK1GQdVPXwvj8TcTYjgCervWuI+F8IOy9G
         6+kklU6i5MZcjPzmJ+E1WvuZiI6rqA0xu5MoRZtFToi7QouiyAiMnCGOrjDXide7Usg/
         E5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511833; x=1770116633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HDg93K558bl2sB4IRlaeHit85Z4PQhKJls60teCPJg=;
        b=fWfTcTv0tgUh+g0MfUhKmyHGcsPkm7BSOIyxfgu7OGvYVO+YALhK+xiPS4wP0RW7IT
         W9iFuw1Q9a7LJA6lSwtIa47zTGV5j+LECTBlfARKj9mtYARg1YZCbe3wHLuftjDg4moO
         qaPUHshOVHEcoFCF3J2y9U+nd6Z5oQ/BvO2H64Tv6HvSEdt1J5egjlrppLRtYCbj74VP
         f+Hug8+9SvVeVmDxNaMHaCvlpzw3skPMm4GQV/R3hDLUZ8Y0gOaQ00NJrFUNkxuXMhy2
         KJ9OEUJdFK0Mu1iiDoTagkyo9il0kHp9q/gRTHhOORhR4d4XIMAJDeoi6yYMbejpLKrp
         2KTg==
X-Gm-Message-State: AOJu0Yz6awiZjK+Df6ROA5HAb7LYL5ncT7RTgjublDDCsd6g70sJnfqb
	iOVvtBHT8exVn04dhvu5B8RVrL3X6ilhp6JWJRJ00X1FFWcbqRtwafK0L4o7Z/hm73e8nrVxUTf
	SNxabK2DICOiXBExKT+Qc0eo3pbNgUMXQwA69GqbMNF5jSXoc/d7oFHvEFCfhWgFaCTiQ0kmAXo
	Zr
X-Gm-Gg: AZuq6aIzo/yc7QXKoV7sWBf2Xn479eUz7uueZtVeSdPeWxs8eR0tXKzMHb2FCR7a/Dj
	wy8m7hvUotx4IcjTQOYSh7lnfpOjcwt2Xnzz1JC0Vk0nQ9gfYvNzrSgFBqu1mP2aJrd+vDA9Dse
	2IESd0atkIv9SKvGXPbIhyzMDsUp5V9ZuoUOtWaQfxTB1fGn3S9GRywCE5HlLg15VQfKLzkp7/E
	hhpbl67dJROWFweWLCT3DHRgzfQ7pOKKBSErwov5RXUIOrnjLQECTZkzr0qqmMo1EWIQcDNHZwM
	+IFmavF3FgtbTZ/VF3DeRDis0xQ+uDqzK3BlCLAFaQeDoKmV90CIyKbHM69zT1D6Bz34oXwV022
	hsuI45ikD6mojHe573A7qrLKwCHFfhZy6TQVtrXqdRHjOYxOBDMvxqoc/C93dXXLunXY=
X-Received: by 2002:a05:622a:14b:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-5032f9f3eb2mr9633291cf.7.1769511833436;
        Tue, 27 Jan 2026 03:03:53 -0800 (PST)
X-Received: by 2002:a05:622a:14b:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-5032f9f3eb2mr9632971cf.7.1769511833039;
        Tue, 27 Jan 2026 03:03:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3e06c5sm6653970a12.3.2026.01.27.03.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:03:52 -0800 (PST)
Message-ID: <a780c082-083c-4d6f-9f35-37170b55339b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MCBTYWx0ZWRfX0RAz1c9TOAgv
 wJNtfgHmWyC4Lpx8vB3hm1RVuuG8m3AaKncxExNRU4kV+Iss1sKxDFtMREsrm2/mnrzjh1TxiAD
 3L/6E2ifPv7CjwEmW3f8l6NXe8v4N1/5dtRKNZqZMsMr75Tx8OPwwN2PtSUfVWKkEzwcx3QLyWd
 WG+eLbezXAyudN5sq7k0cfaUBF2S3sRRsjmUy9kNuZdSHkhNRXPZ9JzfaRfowZJCAKipDV4LeV1
 31ElJmasLpYyrSC+R+zoP4xZE4zhmxG/M/hWQ9ujkloC2c1PM4mTtcMin8hsi4CS4J+RTSAwkoT
 lrDIlJRTA076QQ0Zs1zMSC1ohKWqjFsP70gQULHSBPHZ54/OKvL4OAwMQl6MgFFDS2ORzfkFBKd
 EL3YLHTDZqaC9Q2p7ipFSG9qZ2kXCgZYcGjmUKT7QvXDtXIYw+PV9EiWScXkfJxHmSOOaU95pMU
 HJvWAjjW77X3YaJ3QlA==
X-Proofpoint-ORIG-GUID: tryimwP2Q1l12KFffusZBGc7i6QVopEv
X-Proofpoint-GUID: tryimwP2Q1l12KFffusZBGc7i6QVopEv
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=69789b9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tPD64odK4mGqIG_ypxYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90724-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C78C3934F1
X-Rspamd-Action: no action

On 1/27/26 7:24 AM, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the hamoa-evk
> in the Qualcomm DTS Makefile.
> 
> The new hamoa-iot-evk-el2.dtb is generated by combining the base
> hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This should live a couple lines higher!

Konrad

