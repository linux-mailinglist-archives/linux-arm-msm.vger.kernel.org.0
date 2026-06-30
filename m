Return-Path: <linux-arm-msm+bounces-115400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SqZyHzy0Q2r6fQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:19:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC46E4189
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EuW3R+Zf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FkQp2VH1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D3F33052FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE6B40961C;
	Tue, 30 Jun 2026 12:02:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B754408631
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:02:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820971; cv=none; b=hEutgKbQ0LyDIv2BiA/nOe5LRPFY81P8yZp9SJRocgE203n18xtpXQXWMdWjQ9YlNKdLn0JtJrTDrxDA2iUFHbcUzmqGPnkchSafDsZZRmYJzH/Urevt74pAAwGcZMrtgUZVVOV+RclVL06U2KfZcc+cmYgUT1zFsyttjhYXuaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820971; c=relaxed/simple;
	bh=IkrrKblyFRnZ1byHDFmhe+JUsrlUq48bNUMknB/GoBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnFrJadcX6Aw9tpNiptn5X61H8yJ9sNiTGmgzUEPGrmUMetT3GMKxj1B+kwqjGn75e9UarQSFjGBtDBjH34y+wCFHbJjvis5TTrH5xiy+KiyMTVCZEZ6Ij5J7af7j8r6TD7EkovRzDzYC1AWUHujYrXt8xxul2EfsvDNwatM8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuW3R+Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkQp2VH1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnXr1602555
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=; b=EuW3R+Zfx+vg36Is
	LMQL3/vMGSwPVGz7kxuWFew1GvWw4BbllhgInfnELAPhfsxcKZ0KwctnDnSZ6q6q
	kHxP8m2/jN1MlbLz06zT1OeXWTsXymlnAIyTh/GFd/aL3KlsfnvYVyRcXIts7RiH
	RIqH94hGAZt8zaozgb1Qjfn3GwANxQOYD60VxGRWWHCwZz4kqoFA6lt0GjCXdJMY
	kj3xZgJ6dgAmm9u3WiYQIZzXwdDM5DvVkMvW65IdmK36p0UMaiha7yYwBsTCsFKS
	sYE7adtSzzytESvXbVutHxJ0MSdyeu+of+YHc+2nYcQjMjGDVWcXvFVufWxZflb9
	e1DttA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprrv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:02:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fd28eaf13so2015360a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820968; x=1783425768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=;
        b=FkQp2VH1ajoSsqVleFU6YTbl5dottUE0PY3geUVErP9KxfIng395BCG7jzN/V1avoo
         tvI6i3sQ7uum4rfWycv2EoW2MS5A6lruXfs5dvdcL6O8kdFpzfkoggtSChVcnLPgT9zx
         dOIG3C9Jx3aChfkw3KmIcVdKbWfDbjLolgzl1dMjg7C2roakMSsDsaEUV5wl0OyB3JzX
         qZaH+nfcBh/F8pcqcv+D72jGGh+DTBzD5g+RBFqxyjUm5enhA8GNeRlWfALoeAg9i1g6
         1PZ5tigxOXeeXMd78XIjTjkhg7soMnIgroNP32hJSU8PKXX2RtmZ7rFKUOEs17eZ5f7M
         aB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820968; x=1783425768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=;
        b=qKpV3PBKsywI14UndifaUO25vEJKGyONLRi0+6aePyPi8pJMfE1kU5g039viKuipOh
         PWEEYk+jUpJhkn6D+D/QBVKmYz2IBt1x/hwCkfhIO2Ut9vq21xvnQem5fM7mBUJD3Pl9
         W+7S1G6nA0ky3cQ6UQEAn/PQykplmqI2lkMNqJlKpcFnemleBqPKl/ymQ2U/cxljy1NO
         +H93KhNrenbTRdP6QhBEizt1fnH/dllknGtZw2x1eES5YlrRc+9QY/VRuwJATrXXUsHF
         w/wkZK4qpOxXjPG/49lLfwov4A5UeBhKVbNiJgMY/crgy5A4KWVQuUZS9w1bDHLQkGtY
         fsuw==
X-Gm-Message-State: AOJu0YzHqzLiX6bKYXMxvIQxf0WwNO3WjE0JRs3zZ+u3t9HftUh7WaCI
	riiRVzFWEaOqIzttsdj/p4Sn1YJ3bPz14YQBAFYP3a7EtGqzjgzKfKKL0UwSTc8J+0JEz/4OEFq
	cRwLUdQrmF8uNh7EJhB7u0YC+dFe3oxOmIL5Zxt6lAQ3aLbjE5cUTdLVyFJM9D8fVrP66
X-Gm-Gg: AfdE7ckup/fYzB1cNS9QQiUxNF0xa4kMO8bB0idA9TclGh4BPcF+ZDnwkGC18dDd4oS
	8P+KPJAn5mh53rX8N87wzBk0adQPL7vpJtioJYLwtk61dnVTWWCNwfPWQl+ZpdmCHe7R0Jg0rgj
	HgB1eVR7hVtDA7iuJgBhSFXsHGA2/DvTsR3cxiHCF6lGtWcRKCwXjdW9qSjZhe8Up4q3nUDTraR
	7rxHo2lK65lwVrejX+Xy/gMYkYiX9Vf14I8GVQ2tZV8eSTLm4SDr47gL6dZnKmjw4WmM2HVRZF0
	xrtSU9Lfa66GebKOHdW0U/Tb9y9SXImrjvgL/wbADOdmXzj1v1NzngQC5wrvgu2Zd8Q+Zqbul5c
	8dI3jLfh8FPRG0Dg5pGG9ro1udhfZWit4WRr++bc=
X-Received: by 2002:a17:90b:4a10:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-380527a8cf7mr2310636a91.26.1782820968300;
        Tue, 30 Jun 2026 05:02:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-380527a8cf7mr2310580a91.26.1782820967833;
        Tue, 30 Jun 2026 05:02:47 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f47a3dsm1635979a91.13.2026.06.30.05.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:02:47 -0700 (PDT)
Message-ID: <c039d004-4f13-4e23-be6b-1eba18fd0251@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:32:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
 <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FxWhdWhk9k3bEWnFfTUL_DIf9OQlGX6K
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b069 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kvEoWwmIO5TvxaCarFoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfXyD1Y3gzWXsJ8
 +K4jO9yubRiFSzDBs9w1uKlVPosXVIoAgZ9RJ7LtCltFPLaxf0t8HFoXXHmYiV83qwr5lDjEpGT
 UeLBfPLmohAnIejoaTgk8rA2QswuvlG+4NbSx3tybL/cJW7gSk/Z68l70Tnk13PPRnScbzaZsNX
 lIRDhBpOXffntzsoBzIQ76HQSY0aYw7ZO6DLAQVvlgpcNZhEWOqpxGt7rv022p5NgxbTC69H7Ht
 f2TjHkuydJhF+o55gj+/Njc+hj0iuOL7dANCZlE3slr0LkYXpilxXuWDuzaFN8QTQu77X/N8aib
 qSD59tWRMexluXEFzMYadmH69vOvEBeGX1phGctx25+SkWu+rZK9gebP0nlVnSlFQV65IvN5x2H
 pBwQSm5OMmLXHpKbjE1vQ+PQrfsrB5qzqhclcH1bLSM33phE1dijUgfl6T7gianJdQFxYbLV6b1
 4O+pDFjineG4E5rCYUQ==
X-Proofpoint-ORIG-GUID: FxWhdWhk9k3bEWnFfTUL_DIf9OQlGX6K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX6zCQMUg/b+E3
 6q14FnjGDi6k5OgBiSQb5ecK+iAIew5kb+t53xVueMfg3lBWKNS5zlv5seig+A/bU7QEkQTAVW3
 A7/BBL8Y41CtYaVXHqXKz0VDT1Q+fTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115400-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCAC46E4189

On 6/29/2026 8:09 PM, Konrad Dybcio wrote:
> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
>> IQS EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> [...]
>
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> I think cqm-evk etc. could make more sense but I guess this
> is already shipped, so might as well

Yes, it's already shipped, so we'd prefer to keep it as-is.

Thanks
Komal

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


