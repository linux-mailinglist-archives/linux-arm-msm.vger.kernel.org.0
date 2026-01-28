Return-Path: <linux-arm-msm+bounces-91066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDeuBxhEemn34wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF2A6A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F52630ACEEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEA930AD13;
	Wed, 28 Jan 2026 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfBQTrRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHdNVxki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D33093BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769618898; cv=none; b=Bzt2dDZqNTeGdbjQnCezmpAoa4TVfh8WFV2gww5kBYT9erLloAduK7DPIssJFE2HIjMJiuMFcajvK3KVGEYOzgJi9nM/ip3PtQz0MxbIp9FzKa4nJY5s2KmGisSmKQkNv3Zc6i6SN7im2ya2iqLQ3VYEcohtYsPAXREr3e0PZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769618898; c=relaxed/simple;
	bh=qw4akz2uLkHjv+QOKpF57MAWUCmlnOsR1fRNQTMX11U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gMY3B83XNdD2rsn6ZEfKxoM4YDLY6kKij2Q1aRULihhpVbkretlMeO1cmxNultE6hz7Jc+oJHKXfV8bSMAopVwvxDuT47oeXuTHNIhYZ9TXgrtR8O5XhDJTD+luEHgRZewuIs6saMQwEpQMxyPHVtAUOsasOlWILKuoXaow+ooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfBQTrRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHdNVxki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFPNFb811697
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=; b=VfBQTrRR71tT+QHJ
	ADITeT4Na/MRQ8jGTYFyk4wBz4qhQ1uPjOWFNfuIJc+1zybZ+LyxuA48b+LrayNg
	yfQFONJ/jTZYe86TeY938lhvW2Y9U2nZpGjDfQR9o0H6RH7kAG2neQUvm2GNDAot
	SRNYFTQXyn0iIoEFb1YcoGGqaDd+TEYtB1SDUU3O1JJAdMuw4EBfCatAoJJJNAiu
	k11tpG7lxBefCu0O6LqVvX9OTGh5a/zTr0pr22XajasEo3zJ5kBcjFKFIFxnRIdL
	3lljt1fadot5asEnnhqIODc8Z3n8oLDaRXNjozgNsCG5aNLs/y4hji4SxiSs9oDi
	j0OWxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbkgw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:48:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35301003062so16319684a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769618895; x=1770223695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=CHdNVxkiPpA06ywrKpfPg8nfrA8dOkVGukE1hEX6PtC6mGmQE6d4zFN9oS9JLcg2iw
         ftQPaGDIYEcym0lwhbhZikMci8y8ETHQ4UyfhgEp9HtS1HS5utw6OGBA5qDDwULAkteZ
         TbkEtIYGGNbJOosb6t5pJr7wb1TzWCc5ciGzsCjDnNTGI2sT/buBFllfOdDm+VlVabbh
         xTeRSAWfqFQsn2ujlpuswCvWZvx4UQ0zM9Khg9WfBwGopBohDWREogLy9INb91mtJSq6
         ltRLU2r0ZyBwp+6P89yzsEyqVtUI7kxYPADvWTGc7lijYIICR7uRQl/gu9Ngxuotrlkz
         yK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618895; x=1770223695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
        b=BnzEN8pGwJoIlkfYVucqTn3jaKqEPiBvhNwItAeEgKY3XWNlJuKfkmu8tXQKTQjZac
         2/+wDNozfYkpb5m1jc9Ie0ZcatCuiBbD8IUGUQim14+hJKD0c5Rb7NHJhgU9meIWMEBw
         7/zO4lJHJhIVoNj5QxfZVBzOHW+iYtQ9Y3LWIBTr/Mu4sPA9N5AfSYlIRPDjEIpT1cAq
         pQx2lz61RLk+z9iTZyWb0g9a3xveXwTGlLEFbKXDA2qdHUmWRafa91sBr1a9GePuAfzz
         N98jPuEOzmg+WUHY4XUgH2tj4N48JOLDePpROfzKJOj0dE4pZv+JhkFXlFeByBmje95l
         queQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCd9oC8w7oozIADpniOJ1RoU2xhfgLq+2gHQJy6gCWiQZMOgp+oomsP5XMufn7re+XOFzb+jHNwdK2ixlk@vger.kernel.org
X-Gm-Message-State: AOJu0YycwDsc6YzQqG+/f+NJTTtSTThk+FX1G/KY3w3d930EA/MrvoPN
	iz4NKj11nJ8rjWrabJrs1eCjghUekcLVFv0EL12K7ut8gustyNTs8i9rAEnxHz3EAYCGbI5JLTw
	9DUUh9Nhk662o77qbMfHEsEtfFMLBaf2qT2dFSwmEyM9ACaXYkwQrJGKF7e0uxyA+EJQK
X-Gm-Gg: AZuq6aLQiKe864pCmMX8Y4Ze2bc2V5tzQGtaHQhVtOzKDxcLaUGicnaZiDjI/frriMw
	C2nrVDmr8GHRTe+8+i25X3ACT5sThqhbdZCkEr4jz5CPFCSwkEGhfDqBbOaQSMasB8abM5CHHCX
	qEIVm/MnEqRglaGdQWmeWRSfYNOfZUXZSeABU7caZiRCqoOsFEMcYcOo6eCLhmV23qxAOwbkYHV
	WU6USqW7oOIGCim6R6csognnK4jkTlCCmIZp5N8xWqg3S3MkrH19XqqX8+ebD29R5ipIm3CEKlv
	3XQPyGxad56XwPdKPCgbqtSFfWKat9qMjrvXxXB/eVItQNtVNF7r1nClx772PIhr5JTvcT2LyA0
	f+6LxvRNSxygIqJNSU+rFBSGu1D8+jQHf6N+qTw==
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548591a91.37.1769618895104;
        Wed, 28 Jan 2026 08:48:15 -0800 (PST)
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353fed94929mr5548575a91.37.1769618894628;
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc7c6sm2995577a91.10.2026.01.28.08.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Message-ID: <7d1fe730-1858-4250-93b3-81108fc4a0ff@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 22:18:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TrtVZYlAs-chJqBM9T-guEC7KRtDOBf8
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a3dd0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HFDkwTpxXVET2aFY52jhbw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: TrtVZYlAs-chJqBM9T-guEC7KRtDOBf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzOCBTYWx0ZWRfX6G4f9YnQvADk
 kuMyZxEGx5KUmFewdW1QcfcoxAaekoDeM+wCUjcZCjlC9B5eoFBkS0iMqNesmEjHWAKBRWI0cTn
 tovC2QTwVghdraZm6pQn2OsFQl7vymaYtGVpzkE+maAmwub2p8QEF1s4PryRM/gNj/G1DHPCMfW
 MPoWIYiqtXuprsDuy59OiX6MD3KoEks4rnIsybSWN38UTGIs1zaIDh4ihKwIckkStozhSgR2zTX
 YIEbs4LZX78yPiIRsS+EDxu0xuDZwiFYAhSR3SK5dEKtZPz4z3+Iz7vuZPTnmIaLTJ8Jcal0o+z
 nxaTepmQdFTTFPiR+le/rkhyOPqJvnHU1GVeLGep6hllGvqEcgVTpeqA4YbiGul+loRIJZzk+Gg
 KWGdy9JCAm37HBduNK99AsdDPD61HQcjy7YzTnxlgQNwhz2fLUN59QMLT4HFfm5r4I+yI3O9OHg
 yapy9aGt2E/vwisu05Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280138
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-91066-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76BF2A6A5B
X-Rspamd-Action: no action


On 1/28/2026 9:13 PM, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


