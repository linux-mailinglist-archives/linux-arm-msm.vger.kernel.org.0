Return-Path: <linux-arm-msm+bounces-114127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IyPkKXhNOmqS5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A28246B59F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X1q6wAHg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UX8CQkja;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114127-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114127-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15EE7303B674
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B333A3438B1;
	Tue, 23 Jun 2026 09:08:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A95314D1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:08:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205699; cv=none; b=kTh6XN0Dx2FN9O/y274WGcI+FWXf4ENsp1lB4yr02V/siI1NMXA7hg27HJRrx5ZZRe3pKVf4oV4PmoQYVPghNjsySQv5E67RgrpP5BYWyT9TxtKZv2HaTvJjSneVoXSc1xXdqDLBQ9mUIr7jx1sPTLdyxim8MQhDBcaSi582BB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205699; c=relaxed/simple;
	bh=zM5ygIRfr6T5q2HjenYVrxQr2Py/9mOvTlWDJRoNssE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxZIjLLKJtXYdNFr8wXBUy/iFWfkR3S7L2cWj1bMC8a4T9GDiX+vRX/5DW6njkxqfQ0+r0ognyRstO6blJUXs4gIohZw+Ni288oF70EXz5DiSeyciqafuw08m5aKTHDdmnxC25inEsqFY/xxL95Vqb6K6BQij4LSVK7Q1GHH+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1q6wAHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UX8CQkja; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cl1D3564072
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=; b=X1q6wAHgchGik5br
	XriuufvYcwN3RP2fs0QMtgkyW+O4x3A+0ud7XboJ+OuiJ1YiBW4dd0bRYNIVwyIb
	7T4d5UBjCdnJgmxTPb0HMzjgyTgulP4zKgqnxSl9Z7x5SrB8y3RwTdXk2s9VALMB
	5aYuszB0tuptQLcI3YHhHFHVwpVoOpwIlYUC/qxkPYfqGalptoZTvLN5gkzamSF4
	30FZulovzajYMq5r6LjL2eQmyYetESF0SzuNfphYwxCNfXEkcM6b3sXpe8ylopAK
	lFET7VZpVvHxVmGnro+BJGoKPtuNxL+06Q3bo7TadGzZ9MzE1PrFXjQhY5E8dlsz
	9Kffyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43x1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:08:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845317fa7e6so7689968b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205696; x=1782810496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=UX8CQkjaSjpeQlGlGS4slkjJWoNQ5Ft+VcfpX02X24L5jTV9vDT4MD0UtrsR8pMrOw
         6YzpMjd3TU/guiY8rf7WXbRk7+g/ZdOKwsFWb6ag0+DQuP6LYnr/YF4qTDHYEsLWf/lV
         lGkaPhJl4KhcYzwRkn3rNJ/ceykZWvrlphdtcQinXQ1s5OD0J/QKaFtLekAbhIPCqJEb
         SatCVlzRKF78f1cgGqv4KaPPXZwAn8Fdjr1gdIqP1c0LRxw8/XeHmkCG27RPFcUFWfzc
         DfUO1UWM2iyoeePUdGEW9IkjhOinw6uc4bdonocqy/uOrrMEf6jSFikgu+96NCY/7KHZ
         2ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205696; x=1782810496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=W76u5ZQyFjW71zxX2F7NaKXaZOzL8R75HfgPHQhhch92EhY4z50uzETOeLBbA0jijC
         LTwy+43ewcObvTGvmmzQNUO6zPQ/PXzQmlcdJeD61MfJn87e/KEk3Th+ZqrJ3pqnFzdz
         eA5wdK63UT4wCJF/XNRM4PJfvOVHRRJyLVRuEw9opIKTN++tHCqUBVQc4ZYDlnikV/8s
         yjUrnXlTlKyNLeczkNaGW7ySQel8N3+ecXoR7cMEs5uGpQOJefV/6PHGzZ0Dqjlcixe3
         53Hl+NpDc645EevazTfsSoyw8Qiv8cfjBd5484N4FlVjJdF+D/aJ1173J5dEyfbzzASE
         GAqw==
X-Forwarded-Encrypted: i=1; AFNElJ/xUp1mrsRuKhgDOmqlW7/GiUvaKe4xgmtDAyVmv2bteXmhLqzVPbTo+x6qgKZ5c7hr7ZWwBOWIhHjSqDXy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuByjaSkwM0qBTa4pQuvaMvpay2oCn0ioEPxsZ7wHbNp0iowX
	omCS4MB70zJMKN8Wx16vx7yq0RCnnGH9FnJy83bgya//jemBL+5UzaxBddWfR4wgCqDtgns+Wt/
	en2meeDqHrcc4jfNu5Vxse+sIdzpKQzzeia4DcoLj0HwSL6IhzePm3n0vdzZj/wMUNFXW
X-Gm-Gg: AfdE7ckbzrmFA7Uf72xZEkxq+In959qjYivyJNX6Hokk/VHRY8oLRilm1zHC5hF/4w8
	v2dT/jkfM1PW1tHzCTuEsOIMClqJYxamdtIElXAmKY7NKhCUNfikahqZZAv1m51OquEIqo3b5k3
	xE2QAMkvOZE5fbrK51/uYdRnE7t2v2l2XurrbqdQuCj2lymsTly8yfLSeq4Xesi0NYVDs8a1+U2
	eVGSZlvjYicxdyfyafcp0kKZ0cTFXIy2eLzOCvrTnARSQcdSWpDmwvmBt4/ruRE8r4Kd8gQJom8
	BHcToXC3IEEiPRh2HTF3fFB1axLr2JVQCySnJ7QpC8qU9aX6uUAX0r2aLJsKIjp+ZxTsdxIoDza
	p1YginUtEcZj7D07FiRJJYVl5Hrrf7bNm2PgYBAJdrfW/TfRDP5Q4H9WYJ8O7YnCmq9X+77eR28
	Jn
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902477b3a.9.1782205696352;
        Tue, 23 Jun 2026 02:08:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902324b3a.9.1782205694644;
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm9431287b3a.47.2026.06.23.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Message-ID: <7c75dc89-f62b-47f2-b5ba-63b9e91c9394@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:08:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfX/26E4kNfxZsc
 SlKF58vlsIZL9IB38aMTZOA/eR1itXcHthrqGYoiVVQyrI8TgsHW1N79luHJz0Zpby6Ggsk2SQT
 Fgd7kDyQgf/MpM8JytHYxsesDX8S678=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a4d01 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L7gb0O4lDvObzA7K1y4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5jfXgbsSbyFd-yOvI4IEcE13NWisWSnE
X-Proofpoint-GUID: 5jfXgbsSbyFd-yOvI4IEcE13NWisWSnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfXxCX05NH5SIui
 bPLIm3ozJAxKFevAwt4zM6whgoGgBHEnwX2cJZYttEufVypJUFqcx4ClUAoOlhty6kmianbhxE4
 as7dhJe1A4FK4EtuewzzukoQf6TTok4HsPsqpabzshCPNm9ZbHCeAhr/ur/CgGmyI25G1ncZhpJ
 BoWsLlWwweHaw240MxOyGdPzUqU4RxUAIFp0K2uR+GRPnMzw+DRLF513shE45/EQXrs4hm2H5cX
 AUDe5TmRCzYShVVBN5hcWteChIAEwMfUNBU3nKTZEUvZIJDyAXF0fsfTb7rpfIchljUGjZeY39i
 cGSvQWRyefKkwkzCAb0utVvnVw3tW2vGd+D3p1xbz9pUisG5xvavLhhpNMMYhutCERXx34Ubnsp
 4SpuXTN8kOFh5Eu3HqJpMKoQAeOdIW5qH0dIT3J+fZEzxIuOvZT4idm9CifkMlKVD0x4iW8TaoI
 MCVIFqDNS43iDX5zDTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,quicinc.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A28246B59F1



On 6/23/2026 4:10 PM, Andrew Lunn wrote:
> Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
> <quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
> "quicinc.com" addresses were deprecated for public work.  All Qualcomm
> contributors are aware of that and were asked to fix their addresses.
> 
> Driver is not supported - in terms of how netdev understands supported
> commitment - if maintainer does not care to receive the patches for its
> code, so demote it to "maintained" to reflect true status.
> 
> Fix all occurences of Luo Jie email address to preferred and working
> domain.

Thanks a lot for fixing my email address and for the help!
Acked-by: Luo Jie <jie.luo@oss.qualcomm.com>


