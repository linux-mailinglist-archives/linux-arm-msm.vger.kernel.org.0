Return-Path: <linux-arm-msm+bounces-112843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n+uYI56LK2qs/QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:31:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9136769CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jeNuPdkj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OE5KSVAK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112843-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112843-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72353106922
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 04:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242DA1E9B3A;
	Fri, 12 Jun 2026 04:29:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21E735F5ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238547; cv=none; b=S42ygNI0SnfVafTfnhedT1x34TroWIPnNNYMGiqio2gbl5FxIJPq6VixZnRUSHbrlbzbDqC07XC+qrlU7NbbmvU5MoB7dgrMY7440cBdBMB6CFwol5j3suqUNe8TtGY/5vuGEcBwz7yga8JJSn88uHmXjfwgorUCn4x8+jPHsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238547; c=relaxed/simple;
	bh=Qq3QPHQQplIj6vQL+RwVx0v0hCi7JnuK1p9NR1v+1HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9ZBtqHui2+XifrEBx8a7oUbkttv7yOsCL+W1HILZyCH0jpokeArGYG3v1H+BKHOXZV03flYYakGq4OqGlwFCgl2ChvLNcrL28GrLTwPMZZEeWjfoEL0b5hFLfh1QIDLhItiSdya1QpkIv0rpLuWMmLjh4PcXOltb3Ba8TQYk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNuPdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OE5KSVAK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39PDI2475903
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=jeNuPdkj9czCH5HS
	Qt/sYulB+z5oP1QJXs2uwCW5tjaz1/QC5zHG5zG/ouxsZMCgo/zFXi5AMzUI3kaW
	Tidbokmz2FhKgBRrloIaek3XOLVs7HFbdvIXr5LV0klebXwQGtgh0aTznMcRZGLS
	Jzq0L+adYfkhdzni7WrAvoqtkjqCH99MkXju/iRzPwC9CWQb9b/0v72h5jnz+TfN
	UJ977nI/ixrn2D59bRs1M8aPtdcCWQoKMKn3RO7lfc/ZZgPJSfHk2yX3a3aCWalI
	F2hyK1MP99EXqPY1s5hngemSs068soo91mr755/CwLObP3U31/5bGydZVkEjfuOi
	ZI/3Lg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5smna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 04:29:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84256bee9a9so412244b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781238544; x=1781843344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=OE5KSVAKWlx6vnVLft00DR0uO/adVaZZ3icZLORGW8sLQHJ0akG37TeLLTHJf9izvY
         zbNzcgBIxOUSjJ3jLngw15J+hUviYXnEDzlG2FJ3I9aMdOqzkp65nM4eXQyTNrsMOnA4
         i+hpiaJ0YPk7pwVNLQFKz2Uh29U/sb7dBWigsgAB9jQa5RjUvOibMf5JE+eTP86Y1BmU
         SLu9/Vdu1ogl7cW4EOGEt3rQPkkYlpjaO2QMDoKTetXORLCVOcXsPz6eG7rFYTdzJVYl
         y1DCZ0uD52oVyhZI7CKQnnDrYEAZcE740JfareTOaiENlDKDjtigYCHnRKks7EYsE6zS
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238544; x=1781843344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=hU26Q6dGGbgg4/2u1H0vgwoJrJ3MU7eJUlMPOYvjMMSnnSED9FsJAm57SJzxVoqFPx
         oCkACO5W11jDidBxiV0xiVbHkihO+KoLClYFV+d2OypsTv94denfniUT2bR4Fz+HHdQ8
         Flq6YgKf5XNB4zeBFg4kNT7XBmuZL68V1wlAfvHEhoY+roUgyHCCIxODZnDkg6UQ82aB
         nRWO/qclHX20YkMRYNlwzlXVCqp62nED788EvZdw1rr1B5a7Svj6TKT4eTcn57mhQio2
         ZuuMFUHKEvc++uxXTPPB6ILjpG7FM22tZ4QCSUpWSlG3mxqOZM5dyYRBwzrvRZHYNHAh
         I0nw==
X-Forwarded-Encrypted: i=1; AFNElJ/Gx1KLCPTjAbAVcqxmYgr4hSb2sSTGOTJxyhXBOd2BSLnQl/h8MeLQ2yN5DLwtkqICMKoXwOIeJZFgbqYV@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/qSpG5wXnwGiVAiipr00WfFAfH+JSGD6FnwzzgKC2lTrqLY7
	c2HDn6Ka1UOXhS9e+ubTy+i0o3KuSBEf3fwK5oB1UFcNwJOzmbvLsg3+whNkS8Hx0G5KYWNQdgX
	mXOMfHXmRDQJ8Q0mSZYVLsAbabY3etvTjPtHZ5U9amjruIQK+Uj7hoJ9QeNt05+RwRo2I
X-Gm-Gg: Acq92OHetggK3RZhGjRYCs6gCXGCN+dOr2BkW5PP8f6NOlnw8z3CuAFo6hzUVgHYG6O
	0/U3OfGskCLOEC6FwJ2ojnPCEeSw/8g3Q/lIuaR8n88vbUOzKwGqwfiCH9vrFt/oAfrdZnnYx4p
	ldSmVwHTduDuMXYL9F4vHQ5vXw9hqU+QwXgEJxDJTP75uufit+ip1eT+Sfreg3ZZs3zFtpXMN0y
	zsXqsaW6e+YlpJgm0eblx6AmV2uIVMwRONkX0HgALQlymZuKeUz9juVgGXSejd4qE2MJuhYffGW
	ONCaUEVUOUykkGqE8AAux+QXYTRHu4261wLNDEEPPGaUo4zCPcUc+r9QrrakbrDih663YBKX+a9
	1WfZ98lfPXWjz+EQ40T1FlXZCGL5fBfjGYyMz8m3wnTzr6vsPVPA=
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229407b3a.31.1781238544385;
        Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229378b3a.31.1781238543954;
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm711452b3a.30.2026.06.11.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Message-ID: <ce7a9067-bde1-4989-81ce-c5663a20ad32@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
 <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3uMp7wXEeZiDgMcwrq38kq8dJryhSeOm
X-Proofpoint-GUID: 3uMp7wXEeZiDgMcwrq38kq8dJryhSeOm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX5mV8qVNCuClN
 udFqNqLxSTA8VM/xTsnjQQK0GuHSpM8b7HR1useAWDpUol+cpkmjGX2qVq3kLcznoQkfB42FV42
 Za/4FvEVyeo3P2LWOxPE670nHPNGyjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX9UIMiz3cyjHT
 47rORpxbMYbVRBtjRtTcKXPGNGTBmlYpoGgLVWSC13uGIUghCQq9lK8+62I66sq08XG/kWdyshj
 ZR+yXXVe4ESYGtnVLFS7ucvKg5mtW58VEsTda41e6lS7lBfT5gwEde0XQdcXk30fanndt1GdXBp
 BImJBFXbjqTv5qVmp3nz0is+KT2N6mxAZBYVjjbgP0B/qFE62mCL1ZYMRB1ubhyM5yzUkcM0DJS
 oU5Jz6E6corBzhD5BH17YOKuTs7dTJiUYCYAFyQihebVjZcVudJpSiKfozJoA3iC9zL3/0AIYZV
 IthhZL/Hk5t+lyY40EJdBBpavfW6+Xf53cN6xEl4ChfRxxNYo35CxiusZ+s8195PCqhk+t0K2Fx
 SviQiUm3mtgblgnCBD+0QJTT1oDDonyqJG+UaoQwBwIeVIpF1/kn9Yp/Uy3euoipkRnpJYHtpsL
 MvdhN211HnSaQxJENqA==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2b8b10 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OmvEUramPnncoLCXQdkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-112843-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: DE9136769CC



On 11-06-2026 20:06, Bryan O'Donoghue wrote:
> 
> @Nihal.
> 
> If this is the only change you get asked to make, I will just fix this up on application for you. There's no need to v3 the series for this.

Thank you for offering to fix this up on application.
That works for me!

--
Regards,
Nihal Kumar Gupta

