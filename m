Return-Path: <linux-arm-msm+bounces-100231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNGGAy1NxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E93341AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E247630AEA4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778F22550A4;
	Fri, 27 Mar 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqj1hgLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adzBjRTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B673DC4AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603238; cv=none; b=b1v5/I9D8rskZjYMZB0KJtG/0xpvzXNZn+vWBlPbcUEM/byZDreptpwhFA93eyzyTSillRxjyCfC6aszMMlp7e7NjaMpzXiAeBU7bTN2TSENicoVwpvZuruhkC5lORDo0mxbTWh2hJPkI4lJcYSctVMzOz6HgQvscL5T0p42jNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603238; c=relaxed/simple;
	bh=zB4ZiLmN2RKfWX6WblIwamGdqZtLoGTpjg5bwYuqCVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM5UGy2pLYjxdbl2l8GQZpWe/bc+161sPrQVLwj12JFgTHkW7cibDgiVAACfD8c3Q8wQO/13Y3vyYFJuu4+tS63FgyKJPN6n4uHzJp8FqS68wO9sKcmzblTRGS0C7zgEIUmHBWMJRlVENkS3npcS4PPKMX1Rj7RQCdBUCFpSvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqj1hgLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adzBjRTA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vpYe298507
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHJeKbH0lAHajsANLPABVW3ed/VjpIkjfCZLVcj7SpQ=; b=pqj1hgLBfUnWKrEb
	Se8sdDcAvF7myU9p+4/d86uklF2IbpDzoFubZuEkRD01b+pd2+yGD8iro8hgt06d
	Obtm/NyjEjKcwA0QiT4+lk2y5FLzTr9LB8ROl8MtqXHA6KFderVdKOYelvkeO3EH
	KrpelHs8rs3F8R+zRxT/wB/O6eRFmvdRrOLyPv0SozVpY//4lWmNVhahlvbTkxdG
	j696yrDwqTgodlvAFaukiP0xD+Jg3Fyl8G46d6udZdmuYJjL88385Eeuu9EfeeQM
	bBVgJPRXLJPLdfC3U0dXeKVw+QfdqSN59y0EMO+HL2AmKmM+7DzjQRI2qz/UY8B2
	KNEMGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8teja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:20:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c471045c9so3933976d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603231; x=1775208031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHJeKbH0lAHajsANLPABVW3ed/VjpIkjfCZLVcj7SpQ=;
        b=adzBjRTAPUSJFK0ZjhhW0H1swD/LSgBvoRAHJ/Kr/3ai57B45gX/b7gvow0i0fIRTS
         KsFHtIpNF0gp1dWsS9HWmz5y8k/ksjv/yb0xsbFRsTBIO4Q9dbWlS3JQlXUPYsC3jeo6
         cUu+wcJcCCvDYrKaAx5FDTQkvrs7k6fi5KaGXfM+0mn0Tej3m8KbQonolVd+Mt3zYx6m
         y4TzgnfK832aH9D5bd+TCJEHIofg3qyTLlBhziAze8ErMB7o6RTYDQjRrOqZO41wEXk3
         m4xUtvSmls0Xc8N9K1+fXVbtmTA61UvxhStTDSVUVBoC1/h0u7+rrFBgjhI6kidahoNZ
         6N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603231; x=1775208031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHJeKbH0lAHajsANLPABVW3ed/VjpIkjfCZLVcj7SpQ=;
        b=sl5XgBXiW7b32WX5E+vsPjilxWB3qeJMdP33QW0cU2u6LAxtIy6VokJVKBTzGBJ/An
         hmOvd/UcMVJK+FG1zWsjgnsGxHxXcVISD9nWuGH9FASbKDq0C969j2jhK6cni502ujO/
         1bmMc3w5xrWMBD/uP5cr9x9Lfkax3+EPfDyvAKvpQC8Qt7UvD/EIIKn8ERyN9Uy+dVY5
         1J7aHhvzUBMjenQ9WqCqx6B6Te96TwksS5Ui7HDkXsyZ7kev52z+DrBavLtzUXvW4Rb2
         zqOKqEroA7vFbbU6rnZHtyLA/zyqaHW8tcQeznw8akHd1pemJUFWK1qlgaqLzE1W+okN
         kaDw==
X-Forwarded-Encrypted: i=1; AJvYcCXaR7XVOVL+kYQXlq/r50IPFGhMI74ZN5W5Quvz9UePokN2OOAgkFh+70koJtCmeciP8MpHO6X9vr9CepP8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7TkLbb5hIIs1XNdWpQiffG/aoSTUtVp5r+DoW53a06yEcxN9
	XqDTeXUoE9ayVKRPLV32A+x+aJfCyPH098uBZY4l1yX3wylb1H1soImpkxAjEKKaewE6H2AUnaz
	Gsdmc0ekDXV9jZrMB5m07deGnsajwotDdHzkEJtL/AfHfShweqo1x/DC4m6jeyrlcm7br
X-Gm-Gg: ATEYQzw5pGrlBhhXh+q0X/098udDyLuS32Mu6ChYhRHYcKmGsATLPpUmHO7bzZZVolC
	zRrn4BN2DIOllVA6JTtJ+XNzCLzSUZxrUf19BuBVdyxEi+nvnWOvGUnzxpVngomT5hoEE80v10P
	mbjbQIJ9yHWI+i9DiMoziaabMTNAk5RLMBpsk7bfbqna8+ZoQVD+4OE8acf+qwQijS3/qpCD87l
	LgFm1GarqyceZjYOwfgJMTj8lt58rpXRO0CYC0zpuZIOmZkHpiDrLzkS97ghZOtKme/mYb8g/AH
	8ry6k1OhBexsIw+FkaRTRmVOnzgg3LTxJaTuFoVriG9s8K7oF2QKFGAxbITi3cZ8wAstzgdtdI+
	5024FCid+3Fbi0R6QJMeS9xOz7lcD3vpsjvA/HRDULMVOX9XKHQiyTAn9X8F6uKG8WQ0e0HTl26
	rGRAk=
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr16552346d6.3.1774603230765;
        Fri, 27 Mar 2026 02:20:30 -0700 (PDT)
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr16552156d6.3.1774603230405;
        Fri, 27 Mar 2026 02:20:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2021872bsm226374366b.5.2026.03.27.02.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:20:29 -0700 (PDT)
Message-ID: <b40b9cc3-f3f0-498f-85ff-6c6c31426669@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: Remove unused CCI_RES_MAX macro definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OCBTYWx0ZWRfX9nNPyMTPhLto
 lYRmQA5QUmEV4ZOSR3PIvnqaH3aqE50vnpIRsXkOutKhfKFIFzWFotiV/gaDrPKOkgEEP8yKGdZ
 bbXvDgmaY5zw/3mD/ic1SPZie3qxpC5l6iZDkhxXjBYUD+UlefjPJw36Gua+ZZ9YPSg+NsBKKqc
 etYMC5iVG1InlBAeraHoZ/gS88XSFt1hHavu4n5A725WEx4AjVRL2Ttyjsu+re4hYs759M70xlh
 ee2gc0mrR4tG/qj5SOhLk9itLej8kkzDWQp9siqWJzxHnty5Oh2be1gUunkWsxNy6RHKuXRsUPB
 c2HVE0TZ+Jxx/5L4Hu/Dgeyw76VyFL9rU/cH3O1SAbna3OHaAv46ZABnTenvSFZthylvL2Qtsy3
 S2ihtgLxj+IzSrlgaCJcMpDVYgcEZrxmH4EAyXOXGevYnFYmaPysmp5QKbSJPEVM/9UwMaYK4hh
 3VKbqxStqfr98tAjYmg==
X-Proofpoint-ORIG-GUID: yhhQt7HynEhmRIdsssZdlzchqwf1z8oI
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c64bdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TMqjEctWjwZvrHWsp_MA:9 a=QEXdDO2ut3YA:10
 a=NXw8GaxpU7kA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yhhQt7HynEhmRIdsssZdlzchqwf1z8oI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100231-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65E93341AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 5:53 PM, Vladimir Zapolskiy wrote:
> Trivial change, a never used macro CCI_RES_MAX can be removed from
> the CCI driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

