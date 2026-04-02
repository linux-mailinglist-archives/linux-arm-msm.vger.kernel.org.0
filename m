Return-Path: <linux-arm-msm+bounces-101497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMLdMrs0zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:19:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D2386C05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13CA93010148
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD1E370D4E;
	Thu,  2 Apr 2026 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRyNNMzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nap+kkkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276A368275
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121412; cv=none; b=kGO8fXCkjVfFxFi2bI9vw8ux7QGn4ZuS8c81Jt6YNTLqXeM3T/6nW8dPMDIftO/aneoinukpvBIDKhMnhVHBD65N6pkrIDb0O2ilpxK+5VJ3b6AmM19kpc2itBxprq9kxkaq/yZLbos9yB1RtC8b6jU0+JkpYvuzgZUUO2H/3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121412; c=relaxed/simple;
	bh=UddLCTaZsnv6559x4M4lzB8DvroWR4XY2leIquweXPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAppWalmAV+rxtbmE1J310S5y/F3woggRcvGmY85cinVEL4PmMRwkBcDnJjPhD2Z4WBumhea0/Vvt5rswF+Zq00KfH4uKVZnPEpbH1r6t/EzxdCzXsXsZBYuJ8h8wHXziSmg3gmwnBAZt++VdIf3VixCkeULlU6f6XjDItVldkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRyNNMzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nap+kkkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327aUIQ3955814
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=; b=oRyNNMzsPc92bjMO
	TjStkDkxlvXO5Z+8RUNK3yPjI29mLdRgxJmHC6VH9K6tUqH0zQrjv0E7yDB82EVE
	BuqKfeDhRJ7zO7qKJryTIiXoesFfIJa/ZxaSt+9JmDOSvGyJMJ9e572U235DeiMN
	CH2ce/DV7lawB1+LAWQsXI9PFaHhvtVukBOd0rLKvrYIttn1YLvuLVH9UJJ5+Lq/
	vpK3wsi/lsEwzIn2aDd/oS2KDTu8h0TnxzKpV+vTi8iz90g3TGs/Ipvi9bnYEtwL
	d3+qn2h1qzinb84OhRn6+3skEH1lxBdJSmu1d9QEZG34jBM1tqwndgANeJKh1ty6
	fnZcOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5jd72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:16:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b68af943eso1949841cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121409; x=1775726209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=Nap+kkkZZ40Ajq//fiKQJ8ZV+4VjlZ+4PD61CcJm5OLB0wmW4sFf1o6nwdFgbvWjsl
         7DZfjzq2VTraL6ZaNaWMnBxMnaS0UO2623e1IR/uaX7xtbfMX/BhTj7Ven/p+i9igRJE
         RBEr1/qoX0/gEFBTjgc6CFrbRIQWGIo8iHOj6WKz2nyhtRERrivPP0spIJDhgexP7hf6
         qsy6WuLhObuA4pcjckv8kGb+HDKYn9FvRYyKdIbUU+QL531P/biQ4PlDlWVJ7SB/5hOd
         fM3T/d1IF2hdHS5fvoCGLIZ9nkS85wr6S6mU5nYxrbRU9Xw9GaYRW5G9KLt8R0E9qjz8
         G01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121409; x=1775726209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=HCKNUyaeojCf9cDLv2kJQeg+Xi2aORUcJZFZSAV6jpYHDvc4fbkjwnC4jHS/hT5brp
         vCVMvG14JqwoM15kwpGAPUnD/UnYxBnBXtlb+7adk44hPpvV4aUgx4Z9RI4MdUfeLqfy
         nsClLbkJ+zbaM2SM968Q44KGQUzgbSbbGqVCOBkqcQhw4FtpXnSXd9Uh3gtR0lpi1ALE
         dJqlsLhoHQhhCCqQ+MsDBjr880m0ZAwmvlsCQsSIptPlAEt+Oz89V7PiK6Q0xXgNoOWv
         8Y+iabyDE5GtmA/oUY1icihamKgajbXH2b6f499kApXPyTIXTUhXPN4pgzNCdrnqvu1i
         k8Eg==
X-Gm-Message-State: AOJu0Yxx1tScOPG2xNqXp0ruYcIzBWpJipic4V6aI3yORhH8m6TsDc+1
	ozAE5AadYKDDl2DfttepN96vm/UYe58jrxBVgzrqcL7XzXhyp5amxw631S3SHm+iEqMqbEgTKWN
	lydEXO0KGQSo9dBxAPRajRpYbg0eRZa8R/BncvYZlqWkxzppv5MfqSEI+u4+PPpnQYDUY
X-Gm-Gg: ATEYQzyUmfi7KuGJ+9uEV1HBNBps2TKNfSwdalgSdmBjKPaJy1nIadYtT6pecBNz9No
	CJNp70TbdzotRJzeRLQ62oZRgIo9iWuQzpaIIV/+PjhJDNvvwnCOU8LRGvmAmp+d+Zuo72ekms/
	439lVHR5R/XbRcahRFmwAzPfojVh0XTN9f1rndiIIxs7SoSHA2hw2UFLIlpF6WBd8r5w5onf0/T
	iWA/NH3vsiZ0w+Zmzn+rDajXKktcH+b2PigYXBkXGH4nl4t6n1k3/LkqAMDbjqLx0v2mTgQ3u3Y
	IDHNQOcxEMQk11lkaYw0IKxPjS0ALmVSP6qmaWtSJxeiCt0GpiZBtL8H3vfPop/tsx0hswcaL3w
	pLBX34efZ0p9QwntPK9CUkowVXNbYnw9xNLn4ODlEWwoyaFvmzAgMDCYCBBfkU5rsXcQvohMq5W
	zEVbE=
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474631cf.1.1775121409132;
        Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474351cf.1.1775121408759;
        Thu, 02 Apr 2026 02:16:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028914sm70108466b.58.2026.04.02.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:16:47 -0700 (PDT)
Message-ID: <1c49bd48-85af-404e-93e4-4e0eeb79c840@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
 <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce3401 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=Fern_NpIRorMR8BevXQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 1-sR-AN5BZvZMV3imKLNawqEqdpt7T9p
X-Proofpoint-ORIG-GUID: 1-sR-AN5BZvZMV3imKLNawqEqdpt7T9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX7S7A9tmJ5f07
 ajVEa+iOhjIrISDC8sx2+HIIKLaC1ZyRnMr0FoXKsyQDzF2U8YzFinHbnVJv5ScWHJUifEqtO4P
 GRhiOpeQQeyUBfb9My6TT/XeG7ICr7dRwjWgHrY8v6WlYsEYmViXnGwiFc57KLkT1dMgteP7yVN
 rmXADsqzBFMZf/WDj6fYBoDsnYDgjCBlFIn66qol7qO8YQ61/UR8VUKJgtYA5yGrEEeEDVuaZwe
 uI3ysOFaMwX2mAGJrN6CyBL66igda/W5P3Y5l4FDGjCUJ5kZ1s74uW3TkfIEiDkA2KoJ0TUdcgH
 YPjeUeSh/zpO0GmwKX2HTyB7TM3wNnzPXFjrnC7+eoNozlk/qvZxkp2cLa4nzLD61h02aD9OQDZ
 QA06qGvXqlYZ4mKt3ZS65BAZBWh0J5TzUdkBWqeQ0zHuGuLGlN6mO6rGRAu/JvSdkJfnTNV1Ue4
 2SI4awXlijDhNEYMzjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101497-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 791D2386C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 8:43 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

