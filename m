Return-Path: <linux-arm-msm+bounces-92660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IgTJAKmjWlh5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:05:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18212C3A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCDBC3187DB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EED2EA15C;
	Thu, 12 Feb 2026 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHQyPIcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O75eUbpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3326295511
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890548; cv=none; b=heKLJebfvRwBCICWlzxjJnm0SOtjjM6HZBFVVQtnIslPVreE5WOyMLnPK6bxv3D9oZX52hDPaOse11hOSVDy4JQPm7fCSN6nPu5qYWZrUZq0KFcS0klDnCA80woxR7U6qp4oioI6ubo0qwPTBJcdALwxtjA4ol63aeYd54Vqkrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890548; c=relaxed/simple;
	bh=7tOTSAZb9XaEeIQG6HfS8r7EAoF4DHbPVcHC/hVgxbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2cYulOtTzd16jIjfHf7D5Xy4MVXE8Tdocqf6W0SKgnGhQdxQr2LbsTnDxxeC1y8y1eKZ3GOVHZLsZT/DaIy6ASjdYJDlWr6v4l9FnH8j/DJ+IB2jOapfbbSjvwdaJ8nWWxzxCB62w5WAboOKnR1ebr6jucUq382dMfpqltsg7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHQyPIcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O75eUbpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RswF3963695
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBgvHgw0JlgSEht1MZhveU6tFfBI7N8O2FzIv/0/rnA=; b=NHQyPIcdQ/Zy8Ifr
	rFKlzImGUFQkhDWuFaaocr/H8wAv6EGSExlDSvuG8BkbK4tubxzwPFZubIyPqS39
	Lmv4SdWbl4U+5RToH1iZqDDmR+2SyR7f7U+vEVBDIaPFS3UyRTlDN3fsyybwf0Qa
	2V3mQUVw2AzJXMbG0nck9mhuPbDGXf46wHZKkP/9airu5uVk4iNhatTBfvlbNU+D
	Hu30Bi5ijLvymeGTwcNgAZzcSZ3cYKoKB3vmRvGkYM5FHPg5zG4pgm7TQK/YiMSQ
	rBcNUrOxKmUHLlExyawih4mUgchp4Cll/MBW03JptNgiqrNGk1TGRxKnIcZXiXUR
	337rgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntgws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:02:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so266202585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770890545; x=1771495345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBgvHgw0JlgSEht1MZhveU6tFfBI7N8O2FzIv/0/rnA=;
        b=O75eUbprdZSC4gg/moz9WlTT+J54gYIjrWFE69BJEK3SuFyRzj+avBdE3kkDxUs8he
         5714yhifBy1iU1vo72fcemA/vORdVkIuUkSumKay0chJycdQ4fnhSKqx5PCUkMIJE61d
         8V+VJgqbWLQlhH9/OE8a5/v6/VdC78qnc8oV75zx1+vCTkQPLQhgH+aoayN1FV0pUIbT
         Xohz+0DVsayBXj7zxokltOIimA9HboKhAGPFMgyBppy8dIKFKTd/+YPjaEQ1rOsoCprT
         HlcQwx9iNwgXHN6xYDKYMfGGzIRkz2MIV5yB72x1nBkrBTqw56vLkgjJX/TOKuE/CEEj
         MeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890545; x=1771495345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBgvHgw0JlgSEht1MZhveU6tFfBI7N8O2FzIv/0/rnA=;
        b=AePx6RR/K3Az2NVdOOkiZth6nooRKBdeVvkjM13PBYPvzbBTcO2YtARMz3prm1q6NO
         qrLH9CFfoXFjMvzg5t+0iqk5AmajiztjID3f43zVGLUxeIQjdqlJ8iop0uBSqhZCYVkZ
         b7581NzSVSoZnsEZDLzJbKG/8CHZvdphdb+3OEsCB4rolgwZPZyTcMsGs72zloGyEr13
         gBMvTGtj9tjcJO9sns5XkE/5prMggy4eCrWWguCgPy/Yz+7bC0hh2kkuLc1X+FHOJwTs
         0rHnNDSJsMWG/2mDIfqjpTAzuYn/rp1ZYMJWGSUb5Rxs1jnYQDP3BGnAaU2YN++b4F8n
         0gmw==
X-Gm-Message-State: AOJu0YwHjmpwblGvMMRH677n3wMj90tWHlPCOQGPqT8SkR8j0GgU/hIu
	MRJB56MHy//LyTGhxvacIKXg5AJfBiGq2wlDv7J7zb9o1n8Khx4+PRHOw/Fo5zvHgyiYFUjPpEX
	nkKWXn3X3RxXYWjQ3AJ2jK+EhA3tPVpgqkqrfWCcGkLXNsL5cjM/b8N/TnX1aw9z9VX+W
X-Gm-Gg: AZuq6aINUZFkiwS0cyfdSx4IzTezvO0dx6gamBQSiotbs+Ic8McMt2/HJSuMsaBq9Ou
	jik4xGwZk2oMqXtIgpC2ab5db/heXcs1uj4R/P76HIYSGhHlNF3EVocN8wv4dJEzieDIuu5gQE+
	3zrcAdPFMp4iXfmIBD0PjdaeT8LxjypCTSxWcvv6fqzm4kFaThV9hs9ja9GWf+T5gyOOexLqxga
	3Qt0McrRhsrbsH3zBTQYcIfgbqXztd8QJH0mUUDnuz3pYbhUhj2XhBEXRrzwn64MjmGHyUlxEdE
	MEdfWTk/Flm9Vr0C0Tdwtj7eyuCEZbwLqHDSs8fFDmtWmbQ5nPsv2JWYMp0uglW7wDZ6J2iggHY
	mxXx0srv6xfQ6ZosInIHc8SfPD3JAkZjVQGRVKgQnsXSGVv2Po47V2GOn3kFiGG1G5s0QgXDfic
	Km2wM=
X-Received: by 2002:a05:620a:372c:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb33079ac4mr209266285a.3.1770890545129;
        Thu, 12 Feb 2026 02:02:25 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb33079ac4mr209264085a.3.1770890544691;
        Thu, 12 Feb 2026 02:02:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f84bb7b0fsm98922166b.1.2026.02.12.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:02:24 -0800 (PST)
Message-ID: <6fb5dffa-b7e9-45de-8ed1-d5a029d7e2e9@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1-vivobook-s15: create a common
 dtsi for Hamoa and Purwa variants
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>,
        "Colin K. Williams" <colin@li-nk.org>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
 <20260211-b4-vivobook-v2-3-9f500415d2ed@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-b4-vivobook-v2-3-9f500415d2ed@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MyBTYWx0ZWRfX6BKrFAN/5hW8
 YZlRtiDCzB41Cw2lnZZ2ebSmSleU67WGvtsdM1gpZswHo9gueJabQo5zufaH/4EI+D5VvM85YTV
 2YZ05gNlwmbMUBN6gmilvslcGhBhwryu07ypaEGRQfXiG+0fRou81cZONTVFvbVVY/irOLko/Yi
 6qvdVOhHl2H8MRJ/fn5JC/PH7vDrHeE3fboHZugbf3XAGvByas6dxkJR8UuozFYLRYrGqv8PD8w
 mZZNrQ+LIcIbueo5wsfUENa9gGyNyq2WWTtNy6j30OtlHJ0liZGFI0Rt5sIwDJ8LNwjQSopA1gM
 yma8wJYptTiqtOHBvfxLtW+nUsNzA9rqLDJbgTt+qRZQHRt8QArBMeErXBaHKqeYqJZgJR/7OPx
 d/q7mBP8dLAPyEKNkkhwkcDSZrVsiME0H+2Am6cJ1IWqlsKZJyLgeyW/e8htrgl6XnJTQ0kbvtg
 LetzQsl/jE8aKp3TSLw==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698da531 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gxl3bz0cAAAA:8 a=MmgdznzwAAAA:8 a=EUspDBNiAAAA:8 a=WYNPMBNVD5yvkyzGaEQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
 a=bHFXaHSPdiGCh6GRCv3g:22
X-Proofpoint-GUID: HiChLNLgWLGspA_drfDcYE6b-F5xYqqO
X-Proofpoint-ORIG-GUID: HiChLNLgWLGspA_drfDcYE6b-F5xYqqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,oldschoolsolutions.biz:email,li-nk.org:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92660-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail,li-nk.org:server fail,oldschoolsolutions.biz:server fail,oss.qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB18212C3A4
X-Rspamd-Action: no action

On 2/11/26 9:37 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
> Put the common part into one dtsi file to be included for model-specific dts.
> Include the common part in the existing Vivobook S15 device tree.
> 
> Tested-by: Colin K. Williams <colin@li-nk.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

