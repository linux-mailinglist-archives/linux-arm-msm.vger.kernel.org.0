Return-Path: <linux-arm-msm+bounces-112717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/kCLcWUKmqwswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:58:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DD67119C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:58:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="C6mvT/En";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RkbyyFgk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112717-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112717-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D1353037BA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98F43D9DD4;
	Thu, 11 Jun 2026 10:53:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9533D565C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175234; cv=none; b=bnM/ZPo82n89BlxlbJ0LRjIYsU9rw0vR7Sa9fI3/s5YXJMfzc+mvTVagOTcgZCFk0EcMa15/cfDO2y89oYWtKbMts+e+PsvBp41bGI8erfEVdu5wjJqTgSM/aB1M6riwqzoRvZlKILmcUWUMEjrR0nCJ/0uOntMqYiyMigJCOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175234; c=relaxed/simple;
	bh=GxDTxeHFK/eiM5uFeuYnhlQqwrnLjchBGwRhVFBgnt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ke97dnpNHFtBHRBmNL+rKFnfjPEaC5hmFcPFcEJhRxmDc2kr+tz8Qtg98b8MTey7NsCuFUFF9PeA+eaWxCyWjQ4AfA/5Xgl7PCrjq2X8pvlCy8G+JAvuj2gqNf7gBgjK9fJ3rMcGWJMOX4RyUz7BXVO0E9IkGUXsvRytbCTRDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6mvT/En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkbyyFgk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA05Qp318976
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNMaL13kY8fnjRHO1UZhoIM1tUCiI+JxenxdqR+1BzA=; b=C6mvT/EnIe7Qqud+
	qvGydnRSRA08ISJEQ4oIJIxnGMtFVV+7NESO0qkNYhvLrWw1fEL8u8o78IdbJGFa
	qCzay1r7/qenLtApRuqqqSEThU1oqz5bHAdEGXfA2F2Q1boZdKY4Rp1FzX/xe4n5
	GrSpUjiLLdkcsJZW0EGne3WK/a9ZVc/N3hr3ljfhacv323X+rcCXNOY9K/5AvWWw
	/xHTkDpsxcxrjE0fhV4d5xxUWY/l2mjTHK8h9EER0bpqUT9u/jz5UrB8QL5yW3JV
	OJxVEiFNQS5XIXP/mo7Op4vuqVEeHwoRlfgfFw1LZMFCNZ/EmoxKrOQj6eUhiqZs
	q46CRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk2ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso13397875a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175230; x=1781780030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNMaL13kY8fnjRHO1UZhoIM1tUCiI+JxenxdqR+1BzA=;
        b=RkbyyFgkcvtnLg1iQgzh4lE762bh6kD7MRNQNTgqkSqdMzd7rQIJLFyCTXHF1piQBF
         Onm9NlQc5ly7I7PrK2pxsET+j+BDAj5b9zmKij0WQFOD0pZKE8j5V88Nb/PdTskiF4VP
         2Qna77vd+U3tbiinI1M4SHMjcjzQr9Hi4DDLk+wbl6Gs3ubt+nKPugJUh44tVLn7DM/k
         6Ts4xZNZgmrO/xospPC8N57zUb9j5DUBmfQfwUR7enfZGRWrclsKjmuTzpXYR6VmWURo
         AcoKWIBOF30IJ82QC925CDaa5WQZKivWgjthW+nmo/fjRzp+k3BdEPFSC3EeAyabmr2y
         zFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175230; x=1781780030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNMaL13kY8fnjRHO1UZhoIM1tUCiI+JxenxdqR+1BzA=;
        b=BlV6SbNb7sQWrZdl11dLf9CTMUyUPFT61U/buJHTMM5wkvf/+BrN3lsX3KGLd7Ke+5
         NInW9awLUE6tZS4+svnXr8Ba5nIX7Y7zvaqsTEbcW29+dc11Vn9tJmPR/odKXgmnqfK2
         fL3ic0bExx67aC3PWTEBwak9UukT6+hiQ3PIYUAfnj6AXr6cxEzeqizowypeW3QQ22+c
         Sw0JKGmjhJvcZyvIJeH3keFQGPF+WXMzWwRbZ9v180ihFrGcYb2XzLrzsop84uL5188g
         JaDK4an/W2Dfo1MUXA+CZ2y96HyNEqj0FjancnMtNj1KOV9LEp5uHuObT7RnT/E2CCJ0
         qEAw==
X-Forwarded-Encrypted: i=1; AFNElJ/VZJ+NvYnV9Kr36n+iRvrGHI1zI2XKkILq3Uu7Fzb92jqDU9CahgU8DUjFmyfNDffw+wq1SJCz0+AEqzLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YySepDol365kkHjlfq4v2Z5kHNd0NGw2nadZNHNvQaFTJOaMsrY
	fia9X4Z51IG3WzXze1s4g9rS+zEJu62uK40zailtkhVjNhZZP5XlCekgml6m2/tDgPlSOKIZM1M
	hlZJHnNted/vRa7E5KLF4egnm7jF6EjbFtj96zhXgx95uMmy5tnE7d/6WKJ1NTG2guDSM
X-Gm-Gg: Acq92OH5w/3o/JLuhgYnscviVqTBZezn/cDYfdiAuuDXJ0k2ZKf898mf2+neMz0A3fx
	4Hd3+dbYhJxctcwKlU5Ol6ekTrrup8mR44oi3Iqsa6LRtebAhlUfb5jSgE7ST8Znd2EnJd/oFLu
	13AwpwvFGV9WLxJjEMV8J1BlMFkp2VfpwS+tkr1tfkMo/GkHngyfHZOWEx7QENKHXTWMLKB74qU
	/38+Ii9aE6zPYrnQSuf5e+IWSWUP1/96eDlklhr6fFOwUIqMlOZtoXLyRzWbONE+08FarDq42Ub
	i3MqWcDat9zwHIeYOmGD3Dm/OfW2Mq1ievU0DZyqzneg7Qr8Vq+asSSM48f78WSnu0ItJwFSzZz
	o+HXz2sOttZI7cOPQMezEYRq3HrSFOxhlWUKW7A23a+ADx9CwrtVh2faYMXgkbKY=
X-Received: by 2002:a17:90b:584e:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-377aa0e499cmr2703806a91.20.1781175230105;
        Thu, 11 Jun 2026 03:53:50 -0700 (PDT)
X-Received: by 2002:a17:90b:584e:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-377aa0e499cmr2703752a91.20.1781175229525;
        Thu, 11 Jun 2026 03:53:49 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775371a8a4sm2178122a91.9.2026.06.11.03.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:53:48 -0700 (PDT)
Message-ID: <c5d085d6-822f-46e3-81f4-ef794b8040bd@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:23:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6ufA45TOr9rhxgYVsMTWxU8A71Dy_LIf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX033o9obP45xG
 25SXUyGFEIAjkT8H62s98LKE569choj6KKhqNxHguco0NaNiK1gxujAZgoAJx2X4D4H4QAmzOpd
 dLMMs+e+AMT378a3ZpiGqndamce9X/o=
X-Proofpoint-ORIG-GUID: 6ufA45TOr9rhxgYVsMTWxU8A71Dy_LIf
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a93bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=f1MDW3AboLAXt7dvpSMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfXzc4gawhNL76i
 eDTl5UTmDbV2LCj8T17W+OMnA3O6y8zNS3F+19ijXLxLfCv6EGblqOTXK9uec6dHjs5OSv7dcXA
 PDjttLA6bqzlLG2WplAtWroh3Jq38SHhLy77ylxboj6597BXSC/zOnR4gWW2FjbYFpD3+qk6FU6
 j/bBasL+JooKYpYCMgAHQL6SRwnOuzV9Lq2mX4cuNpNx1yyxSyv5Z5fzqUE9ttip0tt0mxW2GXM
 YYSPVpt4B9SPmuyEaxohKaKF/YyQIRmDg6t01VVGxnNKiJsINSF01CnZ3JDTM+6zqmsX1JrKaT/
 yt4nBh5hBjbeZPxmT7ntAhnRNqQr/SWZqdpTgflDFYNwp03Od/a8+X5Vb6vV/lM9pdmVSTJmuWX
 bfq4/KW6C9M2WdP21sRK/WO14F0F+atuFWJtFCgEJdI/pg1jJPCaDt91nkdnAfiVcAtm53oOnEz
 +Tsmo09sXNoBUpXCHlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112717-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A1DD67119C



On 6/9/2026 5:00 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>> cooling devices backed by remote subsystems.
>>
>> On several Qualcomm platforms, remote processors (for example modem and
>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>> Client drivers need a way to discover that service, map DT thermal
>> mitigation endpoints to cooling devices, and forward cooling state
>> updates to the remote subsystem.
>>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Wrong SoB chain.
> 

Thanks for review, Ack.

>> ---
>>   MAINTAINERS                      |   6 +
>>   drivers/soc/qcom/Kconfig         |  10 +
>>   drivers/soc/qcom/Makefile        |   1 +
>>   drivers/soc/qcom/qmi_tmd.c       | 604 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/qmi.h     |   1 +
>>   include/linux/soc/qcom/qmi_tmd.h |  23 ++
>>   6 files changed, 645 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 57656ec0e9d5..3d60702a655a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22286,6 +22286,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>>   F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
>>   F:	drivers/net/ethernet/qualcomm/ppe/
>>   
>> +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
>> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	linux-pm@vger.kernel.org
>> +F:	drivers/soc/qcom/qmi_tmd.c
>> +
>>   QUALCOMM QSEECOM DRIVER
>>   M:	Maximilian Luz <luzmaximilian@gmail.com>
>>   L:	linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 2caadbbcf830..a292ce57fd4a 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>>   
>> +config QCOM_QMI_TMD
>> +	bool "Qualcomm QMI TMD library" if COMPILE_TEST
>> +	depends on ARCH_QCOM
>> +	select QCOM_QMI_HELPERS
>> +	help
>> +	  This enables the QMI-based Thermal Mitigation Device (TMD) library
>> +	  for Qualcomm remote subsystems. The library manages TMD messaging and
>> +	  handles QMI communication with remote processors (modem, CDSP) to
>> +	  exchange mitigation state and apply thermal mitigation requests.
>> +
>>   config QCOM_RAMP_CTRL
>>   	tristate "Qualcomm Ramp Controller driver"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index b7f1d2a57367..4544e61c74e7 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>>   CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
>> +obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
>>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>>   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 000000000000..9d88ae48c864
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
>> @@ -0,0 +1,604 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Linaro Limited
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * QMI Thermal Mitigation Device (TMD) library.
>> + * This library provides cooling device support for remote subsystems
>> + * (modem and CDSP) running the TMD service via QMI.
> 
> Why are you limiting it to these DSPs only? I quickly checked, my X13s
> (sc8280xp) also has one on the ADSP.
> 

Adsp is low power dsp, not prone to thermal issues and no TMD service is 
up and running. So we are defining for Cdsp and Modem only.
  >> + */
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/net.h>
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/qmi.h>
>> +#include <linux/soc/qcom/qmi_tmd.h>
>> +#include <linux/thermal.h>
>> +
>> +#define QMI_TMD_INSTANCE_MODEM	0x0
>> +#define QMI_TMD_INSTANCE_CDSP	0x43
>> +#define QMI_TMD_INSTANCE_CDSP1	0x44
> 
> Other instances? Are those numbers fixed?
> 
> Should we pass the instance ID from the PAS driver instead?
> 

thanks for this suggestion, will move instance id part to pas driver.

>> +
>> +#define QMI_TMD_SERVICE_VERS_V01 0x01
>> +
>> +#define QMI_TMD_SET_LEVEL_REQ 0x0021
>> +#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
>> +
>> +#define QMI_TMD_DEV_ID_LEN_MAX 32
>> +#define QMI_TMD_DEV_LIST_MAX 32
>> +#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
>> +#define TMD_GET_LEVEL_REQ_MAX_LEN 36
>> +#define TMD_SET_LEVEL_REQ_MAX_LEN 40
>> +
>> +#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
>> +#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
>> +
>> +struct tmd_dev_id {
>> +	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
>> +};
>> +
>> +static const struct qmi_elem_info tmd_dev_id_ei[] = {
>> +	{
>> +		.data_type = QMI_STRING,
>> +		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
>> +		.elem_size = sizeof(char),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_id,
>> +				   mitigation_dev_id),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_dev_list {
>> +	struct tmd_dev_id mitigation_dev_id;
>> +	u8 max_mitigation_level;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_dev_list_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_dev_id),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_list,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_dev_id_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_list,
>> +				   max_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_dev_list_req {
>> +	char placeholder;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_dev_list_resp {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u32 mitigation_device_list_len;
>> +	struct tmd_dev_list
>> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
>> +};
>> +
>> +static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_DATA_LEN,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list_len),
>> +	},
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = QMI_TMD_DEV_LIST_MAX,
>> +		.elem_size = sizeof(struct tmd_dev_list),
>> +		.array_type = VAR_LEN_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list),
>> +		.ei_array = tmd_dev_list_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_level_req {
>> +	struct tmd_dev_id mitigation_dev_id;
>> +	u8 mitigation_level;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_set_level_req_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_dev_id),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_set_level_req,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_dev_id_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_level_req,
>> +				   mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_level_resp {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_level_resp, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +/**
>> + * struct qmi_tmd - A TMD cooling device
>> + * @name:	The name of this tmd shared by the remote subsystem
>> + * @cdev:	Thermal cooling device handle
>> + * @cur_state:	The current mitigation state
>> + * @max_state:	The maximum state
>> + * @qmi_tmd_cli:	Parent QMI TMD client
>> + */
>> +struct qmi_tmd {
>> +	const char *name;
>> +	struct thermal_cooling_device *cdev;
>> +	unsigned int cur_state;
>> +	unsigned int max_state;
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +};
>> +
>> +/**
>> + * struct qmi_tmd_client - QMI TMD client state
>> + * @dev:		Device associated with this instance
>> + * @handle:		QMI connection handle
>> + * @mutex:		Lock to synchronise QMI communication
> 
> What is it protecting?
> 

Ack, will add more comment for this.
This is to serialize all TMD client qmi request/response sequences such
as qmi_txn_init, qmi_send_request during Dsp subsystem restart.

>> + * @connection_active:	Whether or not we're connected to the QMI TMD service
>> + * @svc_arrive_work:	Work item for initialising when the TMD service starts
>> + * @num_tmds:		Number of tmds described in the device tree
>> + * @tmds:		An array of tmd structures
>> + */
>> +struct qmi_tmd_client {
>> +	struct device *dev;
>> +	struct qmi_handle handle;
>> +	/* protects QMI transactions and connection_active */
>> +	struct mutex mutex;
>> +	bool connection_active;
>> +	struct work_struct svc_arrive_work;
>> +	int num_tmds;
>> +	struct qmi_tmd tmds[] __counted_by(num_tmds);
>> +};
>> +
>> +/* Notify the remote subsystem of the requested cooling state */
>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
>> +{
>> +	struct tmd_set_level_resp resp = { 0 };
>> +	struct tmd_set_level_req req = { 0 };
>> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
>> +	struct qmi_txn txn;
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&qmi_tmd_cli->mutex);
>> +
>> +	if (!qmi_tmd_cli->connection_active)
>> +		return 0;
>> +
>> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
>> +		QMI_TMD_DEV_ID_LEN_MAX + 1);
>> +	req.mitigation_level = state;
>> +
>> +	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +			   tmd_set_level_resp_ei, &resp);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
>> +			       QMI_TMD_SET_LEVEL_REQ,
>> +			       TMD_SET_LEVEL_REQ_MAX_LEN,
>> +			       tmd_set_level_req_ei, &req);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		dev_err(qmi_tmd_cli->dev,
>> +			"qmi set state %d failed for %s result %#x error %#x\n",
>> +			state, tmd->name,
>> +			resp.resp.result, resp.resp.error);
>> +		return -EREMOTEIO;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
>> +		tmd->max_state, tmd->name);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long *state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +
>> +	*state = tmd->max_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long *state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +
>> +	*state = tmd->cur_state;
> 
> Mutex protection?
> 

This callback only reads the cached local state and does not perform any 
QMI transaction, that's why not using lock here.

>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +	int ret;
>> +
>> +	if (state > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	if (tmd->cur_state == state)
>> +		return 0;
> 
> Hmm, again, mutex protection for the cur_state? Or is it provided by the
> thermal core?
> 

Yes, it is already protected by cdev->lock.

>> +
>> +	ret = qmi_tmd_send_state_request(tmd, state);
>> +	if (!ret)
>> +		tmd->cur_state = state;
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
>> +	.get_max_state = qmi_tmd_get_max_state,
>> +	.get_cur_state = qmi_tmd_get_cur_state,
>> +	.set_cur_state = qmi_tmd_set_cur_state,
>> +};
>> +
>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>> +			    const char *label, u8 max_state)
>> +{
>> +	struct device *dev = qmi_tmd_cli->dev;
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!strncasecmp(tmd->name, label,
>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>> +			goto found;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
> 
> If we can read them from the firmware, why do you need to specify them
> in DT?
> 

We need DT, because cooling-device binding is index-based as per new 
thermal framework changes:
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

And also the firmware list is name-based and ordering is not consistent 
across platforms/firmware. DT provides the explicit set and order of 
TMDs that thermal framework should bind. Firmware may also expose 
additional/virtual TMD's that are not used for binding with thermal zone.
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
>> +	if (IS_ERR(tmd->cdev))
>> +		return PTR_ERR(tmd->cdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
>> +{
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!tmd->cdev)
>> +			continue;
>> +
>> +		thermal_cooling_device_unregister(tmd->cdev);
>> +		tmd->cdev = NULL;
>> +	}
>> +}
>> +
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_dev_list_req req = { 0 };
>> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
>> +	int ret, i;
>> +	struct qmi_txn txn;
>> +
>> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
>> +	if (!resp) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +				   tmd_get_dev_list_resp_ei, resp);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
>> +				       QMI_TMD_GET_DEV_LIST_REQ,
>> +				TMD_GET_DEV_LIST_REQ_MAX_LEN,
>> +				tmd_get_dev_list_req_ei, &req);
>> +		if (ret < 0) {
>> +			qmi_txn_cancel(&txn);
>> +			goto out;
>> +		}
>> +
>> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>> +			ret = -EPROTO;
>> +			goto out;
>> +		}
>> +
>> +		qmi_tmd_cli->connection_active = true;
>> +	}
>> +
>> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
>> +		struct tmd_dev_list *device =
>> +			&resp->mitigation_device_list[i];
>> +
>> +		ret = qmi_tmd_register(qmi_tmd_cli,
>> +				       device->mitigation_dev_id.mitigation_dev_id,
>> +				       device->max_mitigation_level);
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +out:
>> +	if (ret)
>> +		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
>> +}
>> +
>> +static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	kernel_sock_shutdown(qmi->sock, SHUT_RDWR);
> 
> So, connection is protected by the mutex, but socket shutdown isn't.
> Why?
> 

Ack.

>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
>> +		qmi_tmd_cli->connection_active = false;
>> +}
>> +
>> +static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +	int ret;
>> +
>> +	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
>> +				     sizeof(sq), 0);
>> +	}
>> +
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
>> +			service->node, service->port, ret);
>> +		return ret;
>> +	}
>> +
>> +	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct qmi_ops qmi_tmd_ops = {
>> +	.new_server = qmi_tmd_new_server,
>> +	.del_server = qmi_tmd_del_server,
>> +};
>> +
>> +static int qmi_tmd_get_instance_id(const char *remoteproc_name)
>> +{
>> +	if (!strcmp(remoteproc_name, "modem"))
>> +		return QMI_TMD_INSTANCE_MODEM;
>> +
>> +	if (!strcmp(remoteproc_name, "cdsp"))
>> +		return QMI_TMD_INSTANCE_CDSP;
>> +
>> +	if (!strcmp(remoteproc_name, "cdsp1"))
>> +		return QMI_TMD_INSTANCE_CDSP1;
>> +
>> +	return -ENODEV;
> 
> Okay, this definitely should be coming from the PAS driver, being a part
> of the platform data.
> 

thanks for this suggestion, let me check with this approach and make 
changes.

>> +}
>> +
>> +/**
>> + * qmi_tmd_init() - Initialize QMI TMD instance
>> + * @dev: Device pointer
>> + * @remoteproc_name: Remoteproc name (for example modem, cdsp)
>> + * @tmd_names: Array of TMD names
>> + * @num_tmds: Number of TMD names
>> + *
>> + * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
>> + */
>> +struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
>> +				    const char *remoteproc_name,
>> +				    const char * const *tmd_names,
>> +				    int num_tmds)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +	int ret, i, instance_id;
>> +
>> +	if (!dev || !remoteproc_name || !tmd_names || num_tmds <= 0)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	instance_id = qmi_tmd_get_instance_id(remoteproc_name);
>> +	if (instance_id < 0) {
>> +		dev_err(dev, "Unsupported remoteproc name '%s' for TMD lookup\n",
>> +			remoteproc_name);
>> +		return ERR_PTR(instance_id);
>> +	}
>> +
>> +	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);
>> +	if (!qmi_tmd_cli)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	qmi_tmd_cli->dev = dev;
>> +	qmi_tmd_cli->num_tmds = num_tmds;
>> +	mutex_init(&qmi_tmd_cli->mutex);
>> +	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
>> +
>> +	/* Initialize TMD structures */
> 
> Is it a useful comment?
> 
>> +	for (i = 0; i < num_tmds; i++) {
>> +		qmi_tmd_cli->tmds[i].name = tmd_names[i];
>> +		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
>> +	}
>> +
>> +	ret = qmi_handle_init(&qmi_tmd_cli->handle,
>> +			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
>> +			      &qmi_tmd_ops, NULL);
>> +	if (ret < 0) {
>> +		dev_err(dev, "QMI handle init failed: %d\n", ret);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
>> +			     QMI_TMD_SERVICE_VERS_V01, instance_id);
>> +	if (ret < 0) {
>> +		dev_err(dev, "QMI add lookup failed: %d\n", ret);
>> +		goto err_release_handle;
>> +	}
>> +
>> +	return qmi_tmd_cli;
>> +
>> +err_release_handle:
>> +	qmi_handle_release(&qmi_tmd_cli->handle);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(qmi_tmd_init);
>> +
>> +/**
>> + * qmi_tmd_exit() - Deinitialize QMI TMD instance
>> + * @qmi_tmd_cli: QMI TMD client to deinitialize
>> + */
>> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
>> +{
>> +	if (!qmi_tmd_cli)
>> +		return;
>> +
>> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
>> +	qmi_handle_release(&qmi_tmd_cli->handle);
>> +	qmi_tmd_unregister(qmi_tmd_cli);
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
>> +		qmi_tmd_cli->connection_active = false;
>> +}
>> +EXPORT_SYMBOL_GPL(qmi_tmd_exit);
> 


