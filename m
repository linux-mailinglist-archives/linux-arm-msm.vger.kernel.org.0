Return-Path: <linux-arm-msm+bounces-108940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIL9APi9Dmr1BwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A55A0CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFD94300461A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1E8399890;
	Thu, 21 May 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkOPJh2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QESG3y5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B546B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350774; cv=none; b=TxsH4lWtyp2/uMgshlC8WaSwZc/4MNl2QAzxlB26mQWS85cTzrfGgGbdCv+f3x1l1t54S9Ki1hosnnV63aQo3Iap6BjnOxOZPyGoMH0BOmWdODhjvu8Twu/YFArEBxciJAszcCAuUg7oQUO3M3aCdI6r9CqRM89WDCpPvWa1IFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350774; c=relaxed/simple;
	bh=nZvRi9nGtgc8UbolhfDcq+EKM61hTa9t4ibifzm+CMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDZTBBOPPWDZaIVNk55nScvBJ1U/k0j+ujADBf57vNGrnJ3VZXdZ/BT+pkBOw0CZl1OIxCLZynJs0e+CZc195QVLv+NMJ3YQLdljUS0qw653WGSYcRL5XnsPIeazxtMZo7ieilZtLYjNiZSbTiZTxd7sYv6sKlG+UU4akWy7lh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkOPJh2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QESG3y5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L68o413110721
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=; b=hkOPJh2DBHih4+gT
	8AysJEmhoBwEzbEieDlbGDJyNEjZf/G9m5v6JZD+tSTbmKMX7osyV4NdoJOTle3Y
	EHo4YDkxu+d84bqyewXSg4hrMrPMHaHdCnNLTNd0tHnPi3NiAR3ojQmbVCw2x6Mx
	RWPCAbxj2C4sv1pCkV0W/A1OuJM9yGiWXVWUzPEurAtqm8GlhrTXSHe9d/hYzNhY
	w6FH7Y60RJs5aI0+cRMSMtKdab8Sfx5zRTE3ZLc+ugNxHjM342td1xHq4t/dzX4o
	u22N7w3v+oYpL/GZF1Sbcx0EdGhFYMf1zl9NgldEqS2yC4XCM/Rv6EFELupD8oFK
	FRVJZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgfax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:06:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so141853085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779350772; x=1779955572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=;
        b=QESG3y5RDk5XfBKhsUwMoz6PIt1QCuqRoFoJijGXWukKoqEyXfzLjFV6pSuFjRBHLg
         6anBuP0hs4Pbl++L44kpHXOpIoWhoFy89ttyeXU9JICdf9pAbWPtAtlOZbwQ51u2SQkg
         uv9ObnQTlyTPhD1M19ZRFjNNOah+AQe7BBXH89rKUR+q8QV5sdZLxBgb7KdabCCzPtIc
         wsrW7rO3D52L6ty2IAp0HnMVzy/BHEn6PRTyXtJKMNfoMyxssyqKSddKppbRe1pCVU40
         fSm+O5/KBpTHFiG3hlaaloCbpz+ET71rnCOd+egS0Qxz1JDTYohwRHDlY9u15EzHCjzb
         skHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350772; x=1779955572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=;
        b=mi+TGf1zgGRjieT9JNp9c+ezvJC2sBoqTZRm1HhjBegenaZ10FQzmeO6p5jrAb+SBf
         /aRYvZA8hbKp0OoYScxlErZ7kfPIAVJrQEgXbmpWY7lKBSRc6AA+hJL2N1QvJdBv1pSO
         XR4M7EYj3gF4ObP8PXMu3H9eDlO1XlAbNwesUXogQhUnz1wka6/qnK8cf6ZKttoH2eBy
         PapOTvl33QvrIXkfCGlyzefwC36m+KGniWhP21aBP2SfgK3+6IUkRtvwA9VeTPU7TAZV
         W77gLW2yUIUvrp/S+Qn4lUbPNRuqwVVQki1FcYGP9UOjoWZygQVfJqK561K0vI4OBGDT
         rp2g==
X-Forwarded-Encrypted: i=1; AFNElJ/+5nPJ03ImlLujsNGPGJqTzmgE8MC8Qow8YdPpPN6ZjN2c8B7gwb4jAprcqpH0iIdKPgZJydUJwovxzXKl@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWzr0IV0sFfbxiQi8Vi1fkd4UMc1ueQyvTnG9FRM6GtqIqLf5
	6aHx+ZWyMl0BWxaMbfYO68Jyw5L01NuF3dxpcGg/jHtnrV7a5t/cHZF/3yX7W8AuYWq+4WxTg24
	6Yixn8axGXE/mjCpgBhLLabN2KyGHWMHvS8d1hK7nWKytEr/el6t4v8Gu1K9w/CNc9mb3
X-Gm-Gg: Acq92OGjq9xEgU/btG7RRnH9BePAvmsUjaAUqkzytUQnJSkmTZk4/rXk6/umdhOFoQ9
	X87Oq+dfRt/tnYxsqaf+aOPoHnu3S1QnfXdBsGaKyy/k/mTsleKfPVXqH1aiYEmGm77cn7vpWt4
	pwfAY9lZSOPFjnCOU6crIdarpiHfm3BDl3lxBwisPhlv992pPt5GXA61qjgm4ek5GUB/XKFSUMF
	U0at6eUKeF+5VSa+3xJV781QLbYW2s64Ms4YssF1foRVOoDg3i7U8lE1BHHYlzTDY/IiZSA+MHO
	hxdoSsE6bINuqa2hH5vO/P66HVVrZgPm3/Qi95RG4hkxtEvi98oTC4kKtqJ1T+QX82Y42J6+LXO
	iLZPT0M5EIUq/XFTKPAJ45Jow+P6H0jDesEDEx35xu2gfQkiNpaoXtY8moh8EdZaKHIOe4qvkxV
	cv20U0Rg4XTFmd1Q==
X-Received: by 2002:a05:620a:d95:b0:8d7:3f45:b95c with SMTP id af79cd13be357-914a2a33041mr152269185a.2.1779350771788;
        Thu, 21 May 2026 01:06:11 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:8d7:3f45:b95c with SMTP id af79cd13be357-914a2a33041mr152266185a.2.1779350771340;
        Thu, 21 May 2026 01:06:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890b23sm13584366b.9.2026.05.21.01.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:06:10 -0700 (PDT)
Message-ID: <209c8586-ca93-4105-9f55-8a3e3464624b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove sa8775p-ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
References: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3OCBTYWx0ZWRfXwqT6c/mc4UDH
 +jaI07KIRn41oba9Ija49UDGwa1KJn2YF7TZnIii6kytjBPPokGuNrUJrSxG4lqUgHraUhjR7nt
 5hvmHZxu79NjgswD8VNgP7OoBfzDfoVSEh0qmzqP1gNOr+sWt2kP7pau95ifojUL4U1qAHRWbRI
 LTWR7ghMacfEc4/A1AyssYkpSG668uhdnW48iyXLWqC7P5BWKGkQGIuxMF1btpLj+ufSjZBcdQi
 /O0fMPROsXYAnrnQG5qb3xfJ+Hgc+OxmYV4bw2zOk3KS5F0sGh0WZMvuqEdoHrpDoYT8jb+DrCC
 ZxsKANWwTNGRG4Rr1MJljlIZKUabCxghEZ40XOIk6TbCCwYTs3SuGm2f6IRneE04RJVsUh41dID
 Yl70QCZNlcfhcofGWBqxDP7TPMPWaglQ/i1b2xC7+qRJr2ZKcp2xiWXMrm+6NSoAU+FsmBRx4PB
 mJjEZ1OZlXM5kx8QqWQ==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ebcf4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jATPDVabTivWjG3ulX0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: X7iCpVqmQgCKt-ZCy4rbFTU_DqgiwZCY
X-Proofpoint-ORIG-GUID: X7iCpVqmQgCKt-ZCy4rbFTU_DqgiwZCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108940-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B89A55A0CAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 4:14 PM, Shawn Guo wrote:
> The sa8775p-ride board development mostly happened back to year 2023,
> and it hadn't got any major update since then, except Wasim's refactor[1]
> last year which had no functional change for the board.
> 
> Propose to stop maintaining the board for reasons below.
> 
> - The Lemans development had moved to QCS9100/9075 EVK and Ride board
>   for a long time.
> 
> - Qualcomm stopped maintaining Meta Build (NHLOS firmware) for this target
>   years ago. There is not too much point to continuing maintaining the DT,
>   as DT usually depends on NHLOS firmware.
> 
> Link: https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/ [1]
> Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> Cc: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Cc: Andrew Halaney <ahalaney@redhat.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

