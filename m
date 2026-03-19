Return-Path: <linux-arm-msm+bounces-98745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lt9EgDyu2nkqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:54:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6B2CB72E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41B3D303E16B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E683D3D06;
	Thu, 19 Mar 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZK+WR6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxK+8fJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142743D3CFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924798; cv=none; b=fdYyTXw0h6LuMk2MY0mNLM8f9Tuxt6HIq3MV4ZR9LdjF0jE2/GQmCBZGrHjJg+jgydGAg8zakoUPnvxUjA7nvasLZdbeLy0vEb8Z6/iIV3KxNzUgvXIAqUP7Eo6+p/5c17XpThRL7jOUu3cVc4kPpQ9tIlZ9ucqLwOhU8WRjVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924798; c=relaxed/simple;
	bh=rFoWY8Hn4+syulhQfc+C41uDe8A/vvp5RNyi0nSSX8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urB+DceMoGjoWo1ZH3ix8s6DQ0/ozUJCrElwOZ6OwzXgXuMVYlUOvqff/b+SeO6/Vvmy6UspOpLk+vT5cb5HJpHAuq1YTlxfIPin8k/fWhZYEYDxt5v4I/iPIz0FepIOH9LmyFmulqtCcTQVfQdEdOcnPyTPmXMnXw0+Y3r+IRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZK+WR6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxK+8fJp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J742mf2666169
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=; b=FZK+WR6HnZPZ7fzs
	e1xNsifoyw6lM1RN84305p3Nvp/0pkcH/TIplC7EkdWqvCESnsC6mcOWtobTIolg
	HCmlg28r9xGUqX1VGTef1UwSMgfHkGyfeGyFbkQRAyjm33WectTPkij1JyIW7IST
	Hsl1V2iUaCE1xuFcYy1MxL3sKMuTXWL9nAXoW7VdFFaoeGpF2JIkbt0MHDGgDvsO
	yOj0mrs8Z6XrCzGRndFxOhpQ6PAtPj4rG/bDmndhRfjZXIf5CmZkIlLcJHoX1ERS
	Ug24a10dYJ0sA9XTWv0IVuRAAjwTA31cBIxwQX/0xTVGnqYfE/6VJW28+XrDek+a
	Rzt87g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54r86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:53:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so6538226d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924795; x=1774529595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=kxK+8fJp5SB57P0b3iMTCjjcQo2tPj5CzXAu53v2yex2dAR5Q8qQzE89BeznP05pI9
         0g6GJS5AacNyC4WFRn1Gc8lYqoRrUHAtdYkPqTo4GOGBz/s50r6GkaElwQWtLK6VsZUK
         1WStH7FjRPQNqPz3OvwkovCNoiQJzflc8GlKqVaSNNZpE6R9Y4vcDOcBWXyicwn1BQoe
         CB2u+L+PVlg1c5j+qU3Eu+pFwmjfRl77X3vJACKlKw9dM0heV8nOFKdtXIG3bPamdDLN
         PB6SOWsthYSjSD+iBFYdwqKcTsoAHXiiTkGAwOhC1SvwHxZ912U5QWQh+aZ7lzfSaJro
         qfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924795; x=1774529595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=ICXJCQa4HsG/N7paoMWaopgTUkQDWU6i07LyIxtrpJ4jT6HXlz8jU3Ao5I9ZLn/EpC
         TkodPQ0TH/9jplhmCV8klscCsVeDk+cE4YZyNp6d/08RTI+eU540lFI+5wrnktk/Wawz
         DuEioK8ptkSDxNnnpp6YzE9yNILWa6LXvecq8kU3ebJG+cecC1UtjvA8W/KDcNDfoWSz
         Kkn5xeXJpX2BizQsLGfdbXBf0NXmR8BMLqv9vp+YMnZLsJjgP+JM4/+BJ4sc9INzJZ9F
         4G7+JzjNZAEt/PXeknA6QmYlEOg0lzNXSdkfpoEgly1a/MOv/Jt/sjxNJr5MsnG5fg/O
         Awog==
X-Forwarded-Encrypted: i=1; AJvYcCUMna0CokBPHP0AWoQjiKVLO0wTKNDJHW75hJAeGj3zl9EhLmo6cNMLxhLfSB5Fvbhg4avYwy3MKBGPwjFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxkmPnerFJN2KLVvvdbKuVIaQEK/w7/zbPosiCnGZm5m5MIMmJ
	dXM9HtAwI7xSPq0eCoD//MXIAR4PCSRskGsHO6vtFKpukwidNSA3cJskfKVDqeRt5ae8jup6bJv
	/UtQP3kx4ZmBmxoHoWKL3KwCj4g/hz+UtxbeuNCj/uL4gc2zPFHSkr/oxF6k7uNvXYRGB
X-Gm-Gg: ATEYQzx/l8JEaE/+F+A5984QVDSXJaK/r3yjk3DgaaQdjaak44TK9AlqRC8c8a8zJq3
	BFNJe6jOgFAK7UIfRRC5o//bogRByQxo31EzoUsCfKuw4zIuWeLuTs7mKhO3bigzbSXXzi2q/hs
	oR4RsdDc0YCxw0lZTPHhPb1/aUv3vT7KEzSJKotauEpNEbWC5L7DJ+Fgq5v59kJ3OuSl5/gEydS
	NxkhtntEVrf8tqaAV/5Ig4/+Czy9K0FzOEGOEerwiKGr3djwBaBIgakgWXH+PBf30ZPG7UyBytF
	BYGxWucGMabjBOHr3QNMQ6bgGZzbU9J/BzPiIdcknRL4BBuXEuILKUxFlXuSeNLLILEr23c+ZcZ
	tY/CpLnxLHc5urdOIJdbm+mfrruvmOrI8puq8yYegJOjaGbfSTDBp8FSO4ydyBUfP/gdaeEEeL7
	zPcKc=
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458456d6.5.1773924795438;
        Thu, 19 Mar 2026 05:53:15 -0700 (PDT)
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458146d6.5.1773924794968;
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17410aesm434895166b.62.2026.03.19.05.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Message-ID: <d2960180-6d00-4a7a-9302-37b73c5b0892@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: videocc: Add video clock controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX7XITKYvcNWtX
 yqbPWSZp30r/n9vFp2b3u1QWTwknv7s0bRxfF/kQN1n6cXA3zGrvXhaDrAipZHGrIty1AENW7hZ
 W4evL2Igt3vwop7bUyznLPvNDw9/D5e24DECRARDg7atm/AVwxgAbvj8AJgNPmyD4DRy6OxZlQA
 Y6Uy4VNAHQsOCQp6eH3pzzRc4O8EN1IfQefupQSuB/V3+nN9oDPpe44W36D29J3l6ve67lIGNTS
 K4P0mwim6OhMutctd7cLWuGxw9LQU8THvPbskJH862j/dOfQfIb1I3zI1HqndFZjJppbbLIKRXN
 Kaxydh2IWBXpArbYMgK+XMiSItzCm2Odb/M993VmqMOR4IeqcLmxor0zRc1pALpEW8ofst4zS3m
 SlNU+PynTGFT0raYugojjBkV70mEKJA1+e1p1b+aq2CqIIxZB888nDLxUqPLdsPGudVPgSA+HWy
 ZDc0mkgve862t7HQvTw==
X-Proofpoint-ORIG-GUID: BGY4KUFuonMHhbTRuzWjt5sh0PEqc1S2
X-Proofpoint-GUID: BGY4KUFuonMHhbTRuzWjt5sh0PEqc1S2
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbf1bc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98745-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAA6B2CB72E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

