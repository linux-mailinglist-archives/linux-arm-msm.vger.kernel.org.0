Return-Path: <linux-arm-msm+bounces-112389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3y3MCUExKWq8SAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD80667EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CnPBhQxt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jb94o9ae;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEB18306B784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8223BE14D;
	Wed, 10 Jun 2026 09:33:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB53537E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084002; cv=none; b=C26dhHnt2a6yftFDWzVuNWxBhEWFY+fzJCKqUGyBflvAw5JQnInG2bDnRM/ofZj2CTIHtfshSHFLEcekExx94M/aJ1PF5bPsDTxmaqSEAgCJFvr2nK/CoGMrzL3dWqEv2Lkhs4WWEu2DTTcVpN5lDFhFCs/L7eoVJcOsF+iMVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084002; c=relaxed/simple;
	bh=dfWU5dYj3BQEe4knfdrGEtREOTcs2SuFMqVcgJeSZrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KM4hFoTyhAmRXVo1ZZ9rfIk3GnLngt+6MuyWl2rXOI2YoRXT6GUgNFsMhdV19fZBdDQZGa8DNaBMfa4QYu0X8xI1MeqegapSD7zRgFjYn0YyCp9X+IVTOlc/pxKmuiSX6PW8tUvKFrG3OCgBA/I9+/UjWAwv2GxUeoM5auBJcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnPBhQxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jb94o9ae; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7is5J905080
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QtHwMUeXsyPxSQjQqL73zv+JFnpAINM6rZU7wAG2nQ=; b=CnPBhQxthA3sBLC1
	FtD63LOo6GyfL2cBmocXFU8Hot00Dr16VBheg2JTDSjEHqJ+sZfOsJmlyFE5MvLo
	0xGl0tAzlt10jZqRqVBFQDpS6btZe0zKy8Mn3YcLB6GxThPgOBRjW+eIAubdfa9i
	mKbs40KS89w7AJGqtyfefUkUWnH4+Micg+U9Qwz96h912eLrVi8CzqsdW4ub5Y8r
	TyUheMVvF2C8cQvcCITjcDwhUqAYS/N5xvU3kETbTougPQ9M9bvl5+nG5PNwArme
	x2z5KP9AwyYFcy2WVQHDKlAPM++3yvX36qw4Es6KQoyyqD8yhqUeNqPB3m9QGZ8I
	skxk8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuketag6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:33:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso149167485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781083999; x=1781688799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7QtHwMUeXsyPxSQjQqL73zv+JFnpAINM6rZU7wAG2nQ=;
        b=jb94o9ae9RIqVfIwTpfm2XXGc7HA4u2rudwezfouIsBeXVxzglgPjot6n6G/KZj62s
         jem8YjL8kt5MeLsDTc72dbGmK1WqcbWFcUnSKFBgfo/5svum/QtarC0jfB3uNykP16Tl
         xXNNx6UyWwY0Nr30jyqfNyBD1oqIbT69tlXVoHjunOJfR2TIWcje75KQpoteYRynBK0T
         YDDFjflkn+S59UPyIjRiBolFTy7iIctTWxCbjbDcWKTNtMtRCmevcv0Q7rn7Ev0b4ZYZ
         i1uGda1shdHNUH/xGiEKdRJRBJ9Z4wpDMaVd7MTIjzVuTkW52gRJwAKpuL5kU77gPfIK
         bkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083999; x=1781688799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QtHwMUeXsyPxSQjQqL73zv+JFnpAINM6rZU7wAG2nQ=;
        b=DaBLHfG37GPFXwRwsw2gNt/aaAoUEu62Bn9aEpSukGidT8VpkwfrKdPMbWsqsG0KR2
         IMwK+6OFxmGndIFJTRXnUr5aVK4CNQQ66irws2rmZb254/zlyOpmZqsP4CaA0lpIv9V/
         ejB/j3TzHbSBcCICg6ADed9Tilt+xuOgkB5GlfQSQdbjv/U8t+GNMmBs+qQ+QEnRGydq
         qqAzdgVaKLXvlE8LDs9G8IANAVc4grZlbIwEKaC0xmY4GSR/Zg7CpXKqsbFYhycVpc84
         Ab1sJ3M7oKVKkWsU3yRNU2az9T6WoOxnmiXTcb3IlbBLoUqpUx01QsE2a4BxaFyX6sa3
         GW9w==
X-Forwarded-Encrypted: i=1; AFNElJ9PN/zmcvGYQiE7INXsi4URlUEG4PxxaG/5kLncGDugyH+jhHLpt02vr0EcIfHaRUlXHjxz+YdqQHOxZqx/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JWMXCfGPc/S62M0TLyEqho67eS+WLyORdDzO/rY7cF0HJB0w
	9bFgOhCU9K1dSMADwwEjqlcZp7gqT7g3MWLnUuGeoSvfqW+1K6rHjOj8j2J9Evarv2zaVw+5wsZ
	uB4Pxd3CiQ2leFdvJ67Cj8yBsya48UInViZ9lauwvHL6CRIU3PnkdMmV8/Co7tHJRC0oz
X-Gm-Gg: Acq92OEB1YYFYNp57uAjpwedIBo3ZdvWFUS34Hx88mEUxOVpAvhWfSIBfaLcTr1PO3k
	kKlvZ4tytcjU/zBvNQ2irp02B8Veo+hFFXbtuiOBZXywOQPM6v2DeMDpMS70V+/Hov1Xo7BohYs
	OoCO2YrSJedJu+8aR53v34v7XDxJ7ZWyuYLnnGEQfvInbIsBamxJSTuoiaUfcn7KkjeL57nYkD5
	pRO0jLSkEgaYPhYnMjlggJOHZzVdSTeKAcLPpAwjDrsnLmfQIDsJjHRiZHHio/q/QIqv+dFQOrK
	zJX6pLuFmeOoln1Fi2xxglPZBCjHHSLLGz4MNxb+VJ/wXws/Vxh7bpGwEiAtK80/V7EEg4W+U4y
	Qmt+b/ywYx4F3/31mGMtD+v474jbp6N+SvA7e/iiKx+wQ09txDNTXx909
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr659876085a.1.1781083999344;
        Wed, 10 Jun 2026 02:33:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr659873685a.1.1781083998886;
        Wed, 10 Jun 2026 02:33:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm6107733a12.5.2026.06.10.02.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:33:17 -0700 (PDT)
Message-ID: <ca6a652b-b13c-4b28-adc2-3101c053b959@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] interconnect: qcom: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be|_ptr)?b"
 <linux-hardening@vger.kernel.org>
References: <20260609222454.37352-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609222454.37352-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MCBTYWx0ZWRfX9Yo16kzCHUs9
 43EyAEC3B/sk3CcNzMhg+Wbvccjrjn4MijC10gXBCvKGQJF8epnWfsGW3SLGVaCnjPKKcbkeFlk
 bZY9PPoTho2J8akU1hMOiUTlwNNDFUqT8ZIJasn3b3gsaj10lZLm/5uXhLR3vtshJNMEQWiNZ0+
 2abLK9Sc/RPRDSnfUAE0MGQLW0yt29txZyvnWb+q4tSwWIkAw00/qvI+LbjpEXkyYQA2tiRlilV
 Zo8ITvjj2qsDX8cgIu5P/Jitz6vrYldKY1NsxobV+tpZuQhvLcEqp3nvdsEjkSaCVKQBlp0vluj
 JFDnkZEBZOoCOFIshQ0swQcdt1xx1APIxkTSqGWhtPJUd6toSUzNCQR0RH4dKbIQeCjB9Deh8RI
 3rb3+mavh9x7JfpHmK4oxVonFAa3aZMAkkHlG7gxrt+2JY82UmzUpU/SRB+QPAGECG35hdThSVK
 sUPIRAEx8P2zgJnexeQ==
X-Proofpoint-ORIG-GUID: uZ8uoCrUCl0bdBXudi86rZbK5ZVeYDE6
X-Proofpoint-GUID: uZ8uoCrUCl0bdBXudi86rZbK5ZVeYDE6
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a292f5f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YpBc5yRqulYp3uqBtjUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AD80667EF0

On 6/10/26 12:24 AM, Rosen Penev wrote:
> Use a flexible array member to reduce allocation by 1.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment after allocation before any array access.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

