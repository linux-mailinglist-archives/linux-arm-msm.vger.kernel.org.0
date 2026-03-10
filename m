Return-Path: <linux-arm-msm+bounces-96684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JRXHVErsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF18252064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 403B3355C097
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7130240DFC9;
	Tue, 10 Mar 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQ7XflP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNM0ItMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA231282F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149947; cv=none; b=IuEvbZPUQa+WmsE+WzlXpTxJvaiCWSxxbTgBfqzdjR1aM5uEe0A8MEQ3XTSppDi6wmB4iXO+CpCJselDSdJA2yCDpb+ADRlqs7HbUADTMx50jzBRsLxMYUaIqbvspiYA6eYU0/WKERs+xAKyJt3h/2qoAyM9amM3O3rfC/uW1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149947; c=relaxed/simple;
	bh=U5+C4XzzSEp1A0Qa6KbgTHyEJkguOrx7+aMNl6kFp14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s25z37h/UdIpD6T/4OCUT8ykcmzqg7AmGjYc+A/vOIUHvyrlPze68w15G6jIMkCcUFbmoM1g9gLpbJQkpaJyIcHfC5x+R7geP55YzsRD4DJmCH4SQewDGLIvXfyWaqcNC4R54gNTpXGprL26EbsAMObDkCtFdmUpT7d2ixaCLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ7XflP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNM0ItMK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUNk303861
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU6kQQov9ZoFh1/gT9EyHRCBhTtwnZxhMmWTUAb64bE=; b=SQ7XflP+VwtbkNjy
	fI82Md6zPhf2NeT+NSsi2xpZvmZsH+quF5rSztiiNGHu3E1Ipvsi3undAYyxvP0y
	40EZnMaPW+2QPJhhw6Ygh9Cb2eHdmjfUFMdNlBGroLpntGJJQFI91Te0mYNx+TDI
	dVVKYsw0dPUaTh7IkePIzUf1X9WRqZE+OQjls0ClomqcbOZo3OoO2O1By2Q+Q56F
	Q9ZkJhpdtNAPJhpDymbNOUyxVJBaSNP6WTb9PZhZwReTvkymsHrx4KWQysj1xlvX
	UM+6QiDhgkuTl7zXH87hQQjpM2DUD1v4gjfsdaVcRoMBLTzzO2rpC/1461SnS7O6
	OxCqZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0pt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:39:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8e89d19bso114575385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149944; x=1773754744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mU6kQQov9ZoFh1/gT9EyHRCBhTtwnZxhMmWTUAb64bE=;
        b=WNM0ItMKZI0OgZTLChmOpbEFmdgsCN/ny2SJrodWvZ5fIMMfYZmqa23zhynqCa68xK
         M1V4JtSX4lHn6ro82aqbL7hKDv1Xsmc+KFPfv2x3TVddRxK4p2Zk9CmRj07atY1EBro+
         adA2W9a93AJwxi0k4xnpUcRZorV1qOa7jSTe904+soa5lTPfqKZPVZEJF7qzMuKebk7G
         d6ZjPvjZXunEYBcPOJ4JR6ceQZ0q87OTZA9IzLGfT8x6PZ2sKlFgtuerkQYjo7AIku9t
         kIwMe6QZBET8DH6YlrRYhciFj7G+gX6bcNe/ck2wMgMs+CvaFOVmBx2yflYGOtuP2n11
         PmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149944; x=1773754744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU6kQQov9ZoFh1/gT9EyHRCBhTtwnZxhMmWTUAb64bE=;
        b=bJAzCetQdHocr6qINWG09dsmmZk99X5SsZhTshus57ZKPcUjty5bIwJUWBpqIZ+zxm
         Fy5JBy/Jn5X/VbTf8iWm86aQlbJkDrbD3bmRbiMuH2hq1xJyDRuv604uRsfp0okorn9i
         9c99GbNO1zZR9Gt/8lMaqEPGE8lWkJz7NmGa9ng9Kxf1MWHD/XIl6r+aa/66/3SFaB9y
         Ag4aWozhg4CrPu//dusgudLBxShCcQ8PsJQoCNw0k4wNValwYEBRYYY66yrGjVrd+GRp
         nGeEPOPJQIVjIIlxv5Cly0iO0F0qxrK20dYXNcMZe7wrQKiqtIr6oTQ00xB2bv7uYvEv
         Nwuw==
X-Forwarded-Encrypted: i=1; AJvYcCWthTlUu9VHVYzkXZcK5LjgOFVqFmMn7Z+LX1TN+gqt5+p+mzAq0e0AwTyrntUzrSimxDx6x38KCrgwB0LA@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXFQLy01PeJNqLVujaPbwrlg8/fJEKEsgf7G1ZBBrm5Wpmgbu
	XQGYLfnXe9VMtRM82DAUMmRei2weKSD/CbIAmL7CRpUBDgEothSKGhaPO0WEiQJ5XLMFu0hHaf6
	Au300lWGtISOqYnKIJ7DI7avudWRea3i5209hRBwp9AucvxDP8A5ANTZvJt3PgR9l2Kbo
X-Gm-Gg: ATEYQzw5afVPilctxh4SPdvhrpnCYD1QaMgzStqoDI+R+UqX2rroI8EiQCOkm44liPX
	PT07BjVUaQhPRY4vGtsS9W0sFpto1ZuWKtRHJ8fJhkWsUTwqz4G/cXvY7UfjQAu9litVvWEAkqq
	hItYxQae7S84J39G8rABrWutNDsxc4BAcEvMuUHKQ2q2QK5YI8rbQ9D+xsDWlhxK3AEquHhTON9
	OX3lU5TuOmFH2q3lHi/aGuBKd/OSOSCF6CVVQTJvXGHWE8xziDAmHbNme06XTgS6EqaDpG+k6v8
	0YAoAVUqfvt3mKhKTa7cAAWyBZAsAD26XyEyNwkeICSVaFTrh4/ZLGjpJ/dq8mWo5NhqaX/Ro8E
	MheXsAAGw7KTPdEY9BmdGCQ7qsGLL/pQOzpkLLc9ur1jCKqNvlAt/4SWV+J/wyJsi5mqjeD6Dmp
	BP0pQ=
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr512455585a.4.1773149944415;
        Tue, 10 Mar 2026 06:39:04 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr512451285a.4.1773149943836;
        Tue, 10 Mar 2026 06:39:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f13a3afsm488250266b.40.2026.03.10.06.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:39:02 -0700 (PDT)
Message-ID: <f677e96f-2d7f-44b9-b06e-3d184777b50f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:39:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: usb-hs-28nm: use flex array
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304230636.27808-1-rosenp@gmail.com>
 <8d7a25e8-3af6-4adf-bcec-394895519bea@oss.qualcomm.com>
 <5bcef6ea-e83b-47c3-b75a-cfd13e4073c7@embeddedor.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bcef6ea-e83b-47c3-b75a-cfd13e4073c7@embeddedor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fsxvv_BQtIRWjiv4lpxF3pYOuPrtYTzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfX7sG7tuPUfuV5
 BR58Kj9ty/is7HG/ceLoDlBBm385CqwPKporXSoQwIlC1AZEdAyoNyoQ+t/iwVXA+HwiFnd80lv
 vmyIdA1mOwkJaNoHMB8Tw5aB0Pua49cV+ibYEM98cdpQbHvtUUjGp/MqG7WsYA21fapj8pbBU2R
 6isGiO3xuvJem3D67nYLE82+4jxeNrY7mCOhgvrb5lM9NYVfO9PCh/IbI31ytMRM816cfVuu1mH
 fLYxjzB55Ha4e1KZ9T81l5E0yqsjUSfOMC+/0DLoELYAAol+k48NIeSFPkVDH+t0YApNYG3QMYT
 wk05ZnlJwQeQl6M7yKxdveFKsgmyBlNKDlFfdPz4KqelYiTFEVnRCisEnS9eKfwBNPqZPjCQbZv
 7DbsDAPeQtlvdRH3yrq/WAeY/lG7ZFuh9qo/AKEh1iIOB4RFQ6WuK6+qTu6pQL7tN84qvj0/jPd
 ZnsLo3n1/aRYIc/wnAA==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b01ef9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=VKeVQuaD_P8mbeh0caAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Fsxvv_BQtIRWjiv4lpxF3pYOuPrtYTzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100119
X-Rspamd-Queue-Id: ABF18252064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96684-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[embeddedor.com,gmail.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 5:52 AM, Gustavo A. R. Silva wrote:
> Hi!
> 
> On 3/5/26 19:06, Konrad Dybcio wrote:
>> On 3/5/26 12:06 AM, Rosen Penev wrote:
>>> Allows simplifying allocation to a single kzalloc call.
>>>
>>> Also allows using __counted_by for extra runtime analysis.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>
>> I don't see how this is an improvement - __counted_by() is useful for
>> cases where we don't know how many entries there are, but in this
>> case it's fully deterministic (as priv->num_clks is a compile-time
>> constant)
> 
> Will this always be the case in the future (entries being a compile-time
> constant)?

While I'm not high up enough to make those decisions, and if I were, I
would very much not be allowed to disclose them, my personal prediction
is that we are probably not going to make many more 28nm chips, if any
(see filename)

Konrad

