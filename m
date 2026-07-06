Return-Path: <linux-arm-msm+bounces-116751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3pXFo6gS2oZXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FA710906
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LWd7iGqt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JkhyXvdk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116751-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116751-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19EB319F134
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E733AEF2A;
	Mon,  6 Jul 2026 10:33:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE4391E7F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:33:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334026; cv=none; b=rIyVY4lV7Oc9kaXdX0a0/QYaFDg/mplFI7WGRxBdCSSIdGZRaJ9mMc/RiSS0co3n9Xng2VKCdrBxuhQfiZfyyAtbKpchBLCcxmay/0nqTmO/LOmq0GvMqZfeoNpD/ncnkfmRtGQyie0Lqe9dte2koQ5E6I/7R7i8wU6KHKIYVtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334026; c=relaxed/simple;
	bh=OvJAY+33UpQmhMQA++lwMTSQLdFQ5zwlZWNAV3YowUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpkuh7uDtaIxDuVQMvQ45e9cxazgUKy/lvDvGZTY6+jPtzXdeKqPJJpYFrjTdAnRZLyObbgUiNfEkEEwlmiJgCk7GhsuR1w34lCZ7BlG9FU1/TFllNhaLXOLRqQ++0paAJKzNJiRewM9rqgQdqajUdC5jbz7dsCN8pq5zJIqLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWd7iGqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkhyXvdk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693whC109132
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=; b=LWd7iGqtwoil4XS/
	OunbUFLO0NJh725OatDHeAMkxKovF/TOSfepDu5ASuLbCZMyOiCu3Q69ptrnNcS2
	Qdh5hjYnyUayiOFFp7IDJ1lwrFKBagd4YUDTeA8rroX+5mSrFZipq4M6bDeI4lha
	mbjlNs/Jzcveqm/gFQHWrvh0yMLeg1efmQ+856CNMr7595pu1sItZhLWmZHmcbRk
	k+5/wTr32BGlxzWsF1K4Y/8sSpDevTa7DYPW07wmw5gOsbr1gbmcgx+tRJFO96ez
	dW+0AgKtSOrxx0tFbFks4PWqV5Mi/kASFMh/yDhZUYw9e0SaNl0naaMF+YnuckmX
	p8w+iA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98ktp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:33:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9411471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783334023; x=1783938823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=;
        b=JkhyXvdkqQL7C5V3dYfF+JZ9x+QjCfABZk3Z4r9sUIPAc8T2S2QWVFDWJOvq8b+7Ra
         IyE9Vdz6SHO8dqzkYsyqIIpVctyXGjJbUF/lNObmEpcf8TVRJApnouitTZK/rtklrJnZ
         dy2siEXOF97d7yEh1RZ+zJjtd4+e45raEIusbilFkOAnO+L5gBpu6rQp4cFjEN/rEIeB
         iTewRM+zf4AycxzeKjz2oPp8Jyn+CoVk4MdR2bTJrvaIUzhQ+eL6/bU0HLIoWzFtvbVC
         8Ak5AG7fJBJv9YMBnVmP4wfKvvE7Z77VXndW8v3vaBEjVCckuOlWhqhUJfos9GG1XJIz
         +CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334023; x=1783938823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=;
        b=AyKao4oFF84K9YxZrV2BEZ8uQ6H1LKfs3AiUg6MtBUwi9H9LRZjpufZm1U+jQenAjX
         lvQrFGgEmW8wiO1G5ddiiUMA2Q3OW1TseVaUehLuC29fxHN7TG7MzhfS5M2Zrp6uy26L
         1GVsz9K7CHmydka/neHZW/jnTQ+p5fStssc0Oi4wtXJJgJktnYxGccic9V8mzYwKKV5D
         offiQrx75YyX+cBqTsayImnrqe/7JHNK0T9DnVWcU09qVhURSc+K26B7EXbljAWBmYnq
         ED9y9Jo2t/ZNsbjI3/1tLVPfrr+/+u44KTVWccoKCRUdvicX6X4lRfYflrguxwS0yXbH
         /tEg==
X-Gm-Message-State: AOJu0YwCEK3fj3J3P0ElUP2P2xigWfCLECYdbqsIsFy0Ek267fLoGp9v
	v94nJToWDhCcsfcM0EZx17d1+eta3+CnDlm/CmdVBk4932H/M83ZK0HpRKxRlvse4gV+dMYKNhc
	rELhyRAAdgfB5Ol1dGNXDTqFn5OxvORDiUCsXcVQZPJvPFOpmcKQy2HV0GN4nXzHJxvEy
X-Gm-Gg: AfdE7cmXqGFkic5pL1gso6Vq7M/nF3yjq55TEzlA73yDpjHwtGum+97XsSfU2g7B4g/
	YygQD6vt+GhASeNxsGgt6XvE1DpnW2jMlXhZVyYz0n9Y1evx9oXCGZheBysrKBEcUvRR/DumXfV
	g1CpC/e6+jGT70Ho35XnP88Pd2Bjrp9PZ4HEo0hge4w8dl/e+DH3HNNr9LagzpGxA8b4FNf6h3S
	9YYgiaMldH2qk61+L+Nh3t4gMRdVMAhmxhWtlM+xeFYEOCk90T/0rojC+tNB0ZWSH5sryhhm262
	bFTK7+8WwmO19RreC1xF4RUYW0/aigL5l3xb0fjCL5Mr8X/tI47OkblE/wz7f1D9PPBR0/R7Mhd
	0NtUC86p7yOrYe/Tq4GuECJ9mxReL1AwTWAw=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr81021071cf.5.1783334023075;
        Mon, 06 Jul 2026 03:33:43 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr81020731cf.5.1783334022637;
        Mon, 06 Jul 2026 03:33:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a3652a02asm2764065a12.11.2026.07.06.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:33:41 -0700 (PDT)
Message-ID: <946b97b0-6e39-44b6-b27c-fba5b6f1c859@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jYR95LDzV6U57HVdSxmTnRVLTAPxVXY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX4gQd4gJTxZvh
 pZLdPl3ss0b0EzC6lvN76Tule3beZRm96L0hEcKYzFpvl/A3rAZumSMY2iTpd7NqV2G0fADBGuG
 EUDHr1hT+Gm6RTBiG785ir3LbcjFxTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX0Ud5DNAX6l/0
 MnDHaB36hp1o5nb1iS+V1YfjlboAKHdkOQuBT7hPDzRFl9Gx17AtdjkQIRD6+bJaGAgJnfERljQ
 VfV822d/qH7tuJLozYKEVGxSc8k/B5jLk1JwH7VdBD0absuo569YSVwtriuDh0PB9QRJotCAg1T
 av32QoMJvSycFmrpHpYSnbmIzOow1TpD4gzbpC/FGG0uyVWHudtF2O8XaeUM9/jIyP01Zel8S5Q
 zIXpyDa5YhXWTvHvczwA0GhaUBI0xnA3g3u5cL8jlazkjBpdGYEr2hyYLACnq1piGmQ7EfroMPD
 s4nIYlOrqUUk+p04P5gmyD+3HICJSlAfpuM8p/fNjvtrcvtj3bsxnCWe79rMhgVv9UVhDJJKf95
 BFQ4Jf7zXV+Xcb2aM3UMYhdDFVfu4jRXTHofX1UFT+XgTi++hO+vnAJWah29Ty45KzzLokk3txI
 4+sqFzQXrknwF6Vrzrw==
X-Proofpoint-GUID: jYR95LDzV6U57HVdSxmTnRVLTAPxVXY3
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b8487 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GuqtU1ANSuNXSekCfckA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sachin.gupta@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F12FA710906

On 7/6/26 10:14 AM, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors the
> die temperature, and when there is a level 1 upper threshold violation, it
> receives an interrupt over spmi. The driver reads the fault status
> register and notifies thermal accordingly.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

To the best of my ability:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad


