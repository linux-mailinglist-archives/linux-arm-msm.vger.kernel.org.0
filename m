Return-Path: <linux-arm-msm+bounces-112725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fBXVLvmYKmobtQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:16:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9EF671378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jnFP6fbn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PlAZi2z/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0208302731A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87433DD530;
	Thu, 11 Jun 2026 11:15:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA0388E66
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176541; cv=none; b=aAUgYhEBuTrWKjP++K0BFO5mZ0H79jR3c66oqctDr8xiQCAvFhEocO4KO5nfS38S2aYk3gdi//WDqFhx5PiTKos3skkE6VLBsgZG9Y/WO8YEh2rgHVFjWVz+tn7ZG9kKfOcJUZG21Kc5NFTag6vUDddP95wJEgg470Q5KUUYbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176541; c=relaxed/simple;
	bh=laIREpsEBUXAPtTWdF7hMAJjEruMpnAQd2quvID9OoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZ6zvI/ViePJc2Xbx2zc0QcNtPacqKbHWz7tSynsP/uo76qtAeUEsluHMSe5CnzD6ZZvnHF+zekZoICHeTG3szge3D2P1T8e4ChoKqbPTrq4aF/LkBTZI4Q9L/7fzmlH6VpOSInHTZbQ+HKBgWNqycceWtNRDvM+s8OUj/L9hkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnFP6fbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlAZi2z/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xB0S263542
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=; b=jnFP6fbnq/DOZqoj
	hUHohOcZ4dh/W1azTTALWMCBmmtIm15E6O0qiF3BkbIuIfCXnZ1v8tvW9qRvNx91
	QxNNbJXUVNXWO8BaK+c9chhUNgHoN9nD47B9eTr61hR4KztwO+spLVo6j0w5AqiZ
	lNwZnGHYhs7RTHfoL8IDzSm7pFUhEABw8ISIwOfJ7tw/k3wFLIdmD6C72vEOICVj
	aVikPQW07lZx9uT9CwA8U9QKUNPQSwat54GUtupfY65fbCVUqNfg28owqS9y6M80
	HS2eVrffVyH23w1wnxjdq2qD1l7nWRCXXyd8UVSts6Uvl3JNLLDWCg1qHBgB5GhO
	IK30eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu3gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so25892751cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176538; x=1781781338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=PlAZi2z/vBySGa3SKTc/2W1m324XhnyRboPDrrIucGPQFOGKJxFrlrvfKRsRYoHtN8
         3UQuHYGdUm8vMPDtb3J+gYTJIrBwTd4XLMkFmNQwuZcbUZTiCz+E9Clw17Vg3JuEXDCX
         H1BAiOhcdnEkDYljSZHtwtdBQbtiY6OQ5j/pghGPgUfahql4vW3thZc180a/IMM1igPu
         osrdceUoPtYAot9jZ8hN1d2Ut30lb8p9yvCVOzWk8QzBqyFzyW84BeNdQmHmvXQCoydC
         VdJOBuXvPHUgEHT2j8B3UUf292Gq4Hly2zmpRv73JLoY/+U+L3xwvD0R83cqdivOW4LL
         Kkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176538; x=1781781338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=na5ECxiwZBdS1wdAgxJIVZrsZki8MhadQ4/rK9tIIbiEhdCf5pXWzJazERyMZNt3h8
         Anl7jVRowXT+wLzUNmgWgkEkKDE9EQ7Zke62PIGutqZv0Fk+u3S3RG03LMe0lbkuY368
         hlrZf4QSWw1RdpqWnCGTUOufaoBt4pIybb0T2kmc6GN9DIkd/d9gPWayb1x48i79+SC7
         RZxrO7xq3eUm5jaI8ZldJf2A/cMUNXl3KCLxcxRd65l2XvV1Ml1QkGtRwxb+neQSFyuM
         1a9YHOAsQR1B+TBW5+0Gy3nWHpy/T6TcJisclbp8HGAnkivSE8KhXu89ujJwoFzXY/Sq
         5Pyg==
X-Forwarded-Encrypted: i=1; AFNElJ+/2ilFIpxwAI2NCa7CZD03cXOcet7kONsscQTh+s9Z0bWUPjsGNCl1pehkSJ5vhZxQnDq7ERihIntbrbq9@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0MM4ap+lHdYtPDNQ55Bkz9ejTQTlmPTDLK4ocJbbhUDU32g0
	ddEvXjZ/gxWwel685IkacfeQsZ6WnVnnxEz3NsEusRiyFUDBa6dnNfFqa87FRZX9KhFSnfJYg/1
	RPSJ15r3d6BdHUaFDgAlWcJrwtIlNJGrsRVt//2yhiViEwws7FdfcASEb9JbtOWS4FRFd
X-Gm-Gg: Acq92OGCeKZaWRYFrbfACTJ2xbvqx+bY1IFZLJ2Y1THr5Spd7FFXBstJdqKexmT1dWp
	EXTMsGuNu+8kvJJPb2UliHE2Aky7ctP+aVUJ9B6kxOM3PuWgQXwZPVkBNWIO6By3r3NlFDqD4cI
	lXNE7KTjWarNX7pCp3ANDUtMDELNoAVrl/+pWu1CzNk0w64K/jUq6zo2SehzIh6Cfe7/aC9WAN+
	FmtBNExk60weqFJRuJU1yfDjtr9rvGLO0LNbs5iIn0tkQCgLM2g0lXEMDIruuf+P24IUgSYjbY1
	FC/FYdn8XbtXlx023ATGAlxRwwej49CAGvmAShMw4rW4zcDxZjluEpmskF4sdbmcJEK5+0u3oZb
	hpM2vlwB7Xh+3REwlr3A9ccf4DKAHIHwbxqLCX0azDh+7+lNrXJHO5ao0
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22907221cf.0.1781176537532;
        Thu, 11 Jun 2026 04:15:37 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22906851cf.0.1781176536808;
        Thu, 11 Jun 2026 04:15:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm6985810a12.19.2026.06.11.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:15:35 -0700 (PDT)
Message-ID: <72dc1255-a1cb-476a-bff9-a49d960e0277@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:15:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a98da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX1XigXTsjMZoE
 G7u6mdTYZkTXquVQHx+sRJFKjzp/b8Y45rAdwXVGgDT5UHWhbWggrOvd7qP0ZaL79scUrW1Uooz
 935HES2P7+9QDZK3t3E+GWEfRa18NYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX+TajBPu0FU/G
 bvJo3isFzdgiXmjvZVqZTCHUgBQ3etKzFT0AUDa9NkgQGhtX3gjP6C31elIl17PT7eBN2h4HoWR
 oc39EAL+mJrxquULrqUqFRLx0aBOtKYh7vbWiKUNaNT1ahiiG4pXYAC7d8+ileKUPEh2bhWP2UG
 OK2vNSwkFYUp7uiLcPUrCblIabvJaTBlRfAMeMCnEOtmU/diTrGXaonJkjM60tyIpKUaL5zoT2/
 sNZ7aejx5XKoUOpBUODTzgCbBLah75UgDusR7Ma2MtbocRvAUKuodTG+ZVSBqRBb/dWyifzy15F
 VpbGv7ijRqBSLP+xE0gMclH9g/p900UVkP5avvEf84Iwr4dq+Zg2p6p9YRfnv4FLz9EDIMUsogi
 SVOMZO6wijMhaUcjOAkL+zOl+h1Gds0h9nTpptbaUoEO+ZRz9npalJmjiWp9/aVLhhH2dNjWm9t
 TkcwEJnh+SBHjtMAObA==
X-Proofpoint-GUID: A_YAzzKvyr1SSxdkonqNTXPI3TKiBkp4
X-Proofpoint-ORIG-GUID: A_YAzzKvyr1SSxdkonqNTXPI3TKiBkp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2E9EF671378

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

