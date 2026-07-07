Return-Path: <linux-arm-msm+bounces-117115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lcWWInCHTGpulwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83C717513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:58:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jit2uvZA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EMzqd2IP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D08E6300CF22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73ED36729A;
	Tue,  7 Jul 2026 04:58:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FBC23183F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:58:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400287; cv=none; b=LNBJYc80hFbO3B9GBjAGjpqEg6KU7MATAz+1tItpLsG8NY4udihVqjd5EstfAlhgTBXBHZD1TcoBd0t5Q0gPdQm5T3dZo2wwLe0Y5D1ChXwg6xicq8AvND9QZ5NoN1Y7pz3e7EhCDZJjlRs3q0yJphN9KrTyzOO4vWgqF6wo6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400287; c=relaxed/simple;
	bh=j9wWEBK+fxdZ7pkfwKUB3cmnFKbY+8pHaBxHQBIN6Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIcOwVDqLrUEs72eG56+or0X7xCWA2/cXpmtuXQATe6GjbljlqbGfdl27EbVNKJxuhNZAMB8wdm7IICnEQ3mb3fV6W60EpTsYtZ+GVv+2pwvgDyWMWSBy6RrVgKu1n9Tm2ntEVksvIL7fnY3DRnwpMC4zh3MBMYqXJQI6tvYrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jit2uvZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMzqd2IP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674955N2498887
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=; b=jit2uvZAWr+ObEBI
	3ZGHeYcEMMtdtoi2YvyYdgjIGMj20K+xSETDPUSFd82K+fkckHWUIIha+QKmr/3u
	LSO9ulTw+NQbl4WAQNJOIsTcFuSNS8qcQELAssp94dKwZlQSWI8DoZOyyK7V/8pN
	iXZFjWiDrsvAk14C5wJehhZR9DzsVW7sIFeuisJzqOLAYDX0sgrPafApM8Mge0Zt
	EYyeesSoV0wEu+4JJ8rw753IMpjvPRa9BK+MhkFABhB4Vf6Z31eUlOYiGHYPBQEv
	Ae9smLcjJT+xSGsWm+tUukXs+iBmt6rvu/Or+n6PzBOVrhfo/y2VPdQgNtU4fe3W
	ktE+HQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscmnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:58:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384419c6c74so3443894a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400284; x=1784005084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=;
        b=EMzqd2IPD38NL5AOdHAEf3pJkYMW36AGxQLaxm7FUL2+9OEkH5JU+jObk7isItPmTt
         hMUF0o4pBeQSEFKWM9ifELYmPLTNOufVXkTR5mFj0gORAs+I3LnE/cKBhxGCIm2TWiHz
         wRWBDIdifTNGS7YIWjKlz2+ojjJLPElvXOH5xxT0nbzBGtBTAPAv4wfiGzYEuR/PbErJ
         GwQDKzcBBv8ZWqJpbLKF0FV7XRmY4bJcPF1Y5SHogTms3gHGZjOFbf/i/yA47rbKK2dD
         UdqBSTM803Z4ERfumhaFeQAc/qw4XvL5pF/Us+VTGuon2dHnx5H9Afr2iiKyLaFEtVne
         kKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400284; x=1784005084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=;
        b=iYZqIOf0GBr8ZMD7UtuYSy9+q2e1n052BbX06MPLGKkLjSUQfcqYoDycnSpdEA8iyO
         az4WDzMqtYh76puhY5GOXHWWOaiTtgY+1Qg6QcSOcTb4mB/aEg5pYWfet1qf/t02Ol+p
         E/bwucmoEP3/BQRB3EjhbHMKQWMY4av0mTp312FJnK04KFK5Pe2Pz8hYun/YFgpLa+/c
         ZJbi+g5F77JVLlrkSjYlrtCq3ugpwO4g+eGG4hmS3yHOUJEE+NoNsO4+gdJQ+CjxlGOa
         PbL87DiegNfZrj1XzURPq6FgEB5iTrG3oYwZR6YiTO1sZfMDMG97Y7Db2lZf625DqHpq
         DX7g==
X-Forwarded-Encrypted: i=1; AHgh+RoHhUMUOVW/uWZ1BN2sugXwDHIAfvyLndjyncjAw1cNH3E2A+kOp4/PYEfC6RRxVAXuH6RGsxmBdxX1qR17@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPw3qtA4K+da9eIZAllnniPzEU/md9mbPbHKYgQQOXuTM3MRz
	q59mSyNMQqeLtQSWYIPZ4gqUVEiok5Yw/cxbjBf1kPLoVJ+x80sWx/DstNxuHp61ut+pZJHlrk0
	oLIm6ACrsJYp+pP91esmrBOUcENWVSR5Wh3lxZx5yw2kAmq2CWAGm+TNR9kj0TD7XKqwM
X-Gm-Gg: AfdE7cnioOHMEV6NWPqYBH1AXX5ehFVEFrCPTXRNoIeytef9Y2bW9UBMboRDYyjnmz/
	c1XV1QbltitspRhU0gZ5FRvDOybF3UGBUH/m04lTZytzGABSzCgDnwmNgM/PDy5IqTGHOFbiN6S
	DPIHu+NfmZqbzR8TH9jPVJUscxCXBQ6fgRI2hOKFxrdczy+HuVqXyQ+xhr8Thx+UPdOeqUB+Htj
	CFaCk0GKQy0NiQG5th+wPmKJ16aiquq8T3bAYIViMYHuHIoWI25/u9tM9/ljQ9EAVgfvPa6fdus
	3Phc7HnrI2pTtSfRmolmMdDQ1LOZQS63aFDKrRTyqPaz/IDJr8/Q6sq3F/VsPO0R2WFdVRAZg/Q
	/RqyBn3fM64Fyy6dkt17fPeUL76QwSFqfjJXh9EU=
X-Received: by 2002:a17:90b:3cc4:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-387573b0493mr3687145a91.15.1783400284440;
        Mon, 06 Jul 2026 21:58:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc4:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-387573b0493mr3687095a91.15.1783400283615;
        Mon, 06 Jul 2026 21:58:03 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387b6b1f182sm294410a91.1.2026.07.06.21.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:58:03 -0700 (PDT)
Message-ID: <dbd7c44e-eca4-4295-8d20-c9e9e8cd0fea@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:27:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
 <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lqkcPUA3J-5UxzIyDMji83cPPvEmxkPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX+qW+r59k25a8
 N0nUqReFFbP6iO+BSSAo+0T40H5w9W+jGql4HPb6ovXksB1s7j96wlMuMGgS9L0cjLMe3TurcJd
 8q7MPVucBPZ7TSuizSyNg+PABfZitABS7+Vsdv/YtELtiGDactQzUt8NsEr8kvREnFLx9JDJJVe
 vy9K/NrPkY5QIVFV8uLg9wB06ud+TEGrXOAJxfQw5Fs/6fqKKjQU+IJY2tdEf9bpJ5rcyeoP07i
 1TxXifBcIDv+Mqm3wQ93BODy/v/Hs+ZfeGdmtmFas9U2otRGyWVww4y9JcIZanxFWKaCmJAhjgI
 NeRnyEyvF5NxZ0CWhSDqvrxKKloKPYwkXMKciDsKKX82Sd0prl+/oKf3G4yGm5P5wRrLuTYXMkF
 72Ve+JiNB6iImE7gXvEDfE78AjfIfLgDLMcyclrOGqR5xH28j7SOq1SIo+ffbNIBBkWxqnt8xNp
 wMpsWMPvma/gLhSVfLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX3PX3UbwLBG34
 u8jNmiSF6jqbkQ3YdKEwbgO1jELxS61JqvAJd+2r0kWa8+TB+mkouY7yYotiVMKU5DS1dcW3/fS
 yM/KFYKXnPxwvC/+qiDNwhwNdZVSYuQ=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c875d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Z6pN661gba3QK_V_KyYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: lqkcPUA3J-5UxzIyDMji83cPPvEmxkPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117115-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C83C717513



On 6/24/2026 8:22 AM, Shawn Guo wrote:
>> +      - qcom,nord-gpu2cc
>> +      - qcom,nord-gpucc
> I see inconsistency in naming between dispcc0/dispcc1 and gpucc/gpu2cc.

The hardware name of the clock controller is GPU2CC, that is the reason
to leave it the same.

-- 
Thanks,
Taniya Das


