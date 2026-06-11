Return-Path: <linux-arm-msm+bounces-112716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BZPILK2TKmpbswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904B6710EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:53:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tez7sVvj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hpWd25uQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76726304CFCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8131B3D9DCC;
	Thu, 11 Jun 2026 10:53:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657C3D565C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175204; cv=none; b=LpbgbQWhpQrppFp6Gb272r5sP/P6Lk+So66lJG7suXvAxvgQoaOaDZ6diIBW5dCI19JNeIpVXD3CbUsjPVFnhfY3EtsrN5/umJ9IzJs5o7KKCQyy7YVxN64RHgALco4Nuv0+dMUS2zgoXnSuTUaS8RhCKpHp0t5rS0gJmBsl0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175204; c=relaxed/simple;
	bh=BJDKUiivYZYWopkDeJb+zwRxy3QE3nD0PUSgn8cPFqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKLvOdqkdjj1j4eu7iRMrNm7MUNccgQ1PWCxupdWcv+fWuvWnRc8kaLX1MEhDoC91B4OSK6CYttgq8EWNfYgDtVE5WAe+t+14jX98Y4si+4bFA9upWshPmsZTt+pdMMjyLfFbMr6yvD7o2iBFhhDwMGXJ44sGqJVboKFoYWP090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tez7sVvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpWd25uQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA03YV318913
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=; b=Tez7sVvjXKMJM597
	h/kSafLPdTUaO1+veECvcjPcM1sBbSbD8KDbzODU+DjHuZKRkVA+NlWL+AzA40dZ
	jvHF/LYX7AfASoqj8R1xtI2G33Z2FC6lRZmK3N6u8hHKZIjIbtaBj9PFpOJPU2Hz
	BxP/1uUUC9UHdpEOZU9dVR1vD1UBEiW2TXE6xNdEoyN1NU3IZji7qNg5eMazBvSA
	RRkK2BfWUnD6HQXBXC/bpp98G7zK6smAVmPV2Fu4fPlyfUL7AGoHKI1FzYSmWH56
	ARi/aEyArsHIaMD8YN3JiqFr89AuCcUURt2wPB+OO/m0DzwwFo7eaUhxETRAB6ua
	tHiuSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk2vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:53:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beff6b6e74so79824495ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175201; x=1781780001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=;
        b=hpWd25uQ6EPUSiXdQMn6i8LQSD5yP7Z5EzfpLozq5KDgFP8maf06wzgx0qlvansYOt
         e6vuWNUHXzNwvRZqbCCO5C62cNO5lR//nEtD1c8sO/TppniiO9EthllXCgdABzVDf5j/
         L5QZRKls8cXoSwivcl4aKkFNKER/3pWdy1kQ03jVA/OljpEiR7rnkideicHHZWw5eTDH
         FcAnDm28XgXEgHTqhQ/INu48tS3FpmKbEtsDJT07sR9gP4CI6rmhlHb0OoLTIUgGbWB0
         5Uz9Ds5X5yA6meLwh9DbXWaw/Hi5baSO5VHx1SJ0jxxw9hjSDeTwrwOAWzd/guYUiIQ9
         IVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175201; x=1781780001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=;
        b=Hzayr4j0x9WHc8tAXzz9jM7zJzbSGOrr5AgPBROwLS5JHQcf+HG9fBcQX4GhwDgrSo
         QhE1yaOm5kiELKjHQzdoMU6S7DHRSCkW46R77IG3zSjuwnGrRdqu3ZfKoswXbos2AQq+
         bn1l9nw+sHGQVZ3QhHaKb9md/YfSujLaZe5jtNoUH+j6EvwXihuFMGTGxNH4+qOQhgg2
         PetkwIzxGvF0FIiVi7CjMJbwyC5KaLZRFj3vofxLn0EknDPPYrhM7+qw3rEqSee2lg0v
         dzRWn5RMLGl719GBiWR4nYTPgkjGdX959bpnHX5etBZjK0NF3HzpRj1DiBrZjRcN6om5
         KxYg==
X-Forwarded-Encrypted: i=1; AFNElJ99xfNjMLQnpcC5oSVhakweqx/ezOrknGSZNTdCd2FBN+wxAjtwMA4TU8nKhoYpL5SLweEdn+weN0iKyHJF@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwXLiyl68UnxOJ3/BhWWK9QR7J1eu4k4na93ltO9SEBFqjTmQ
	LTJMAkE+IuxWXp7RcYbJDSpso4ATY5W18E2JK0VJ6TvwGJyVqoeFrMYbFwx9s0M9+0KA9hm2l3i
	JIgraPeShDmyoBr1RYcuWf74kbQmaIyMwLYw9p98IFqCGTlndXXGMejUOdoRUs6MMHjKv
X-Gm-Gg: Acq92OFtKq5JfiHXMwSc5vh6R1fnD1ravgw/UHEfqDp6t5OfbqH6O4TvEl2Y8617YCC
	EP+6oaa2oku2LLgX8dGcDUB1h7aZfpiV/vxLAb1b8VTfad01H2Hh0j+h+IyDo4JWIxLotpOH4bU
	223Ma3rIKnb69D4S3ZgR2KiTh2mSCCZf+DEtjTiRcPFSKSy6/aYKs0UPB889rVnlhs7Z4IQtxMa
	pyXdyk9fv063Z9+j8HSB9GVWT7x7/vOPpay1z+nS3UQRDAPtf8/VOQemHQ8Ljn3k/tBIlYwVMym
	qz4T6mkaXaIDwz5kqx2E/CgmFu231QUW0Idm4a7ps7aKcp+cjENcwlqM7YknMm/SiyJ1Ca+ugIT
	q0iDm93EXfXMEy2cNjbeIbqdW0IvXE5cQkIiOF7jBfw8F9ZoufEHoHIln0Mg=
X-Received: by 2002:a17:90b:4d84:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-377a4ab6f54mr2587775a91.13.1781175200947;
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-377a4ab6f54mr2587743a91.13.1781175200493;
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843383197e5sm1663475b3a.52.2026.06.11.03.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
Message-ID: <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:22:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
 <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r-U32vedE72Yh4_lVxwLAUj59mejnG9b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX605Xwls9ktUv
 6mG9QL9PajMcvo70ebzqOC5NDWbIi93zIP7DXOvB3UvOhJP4E/Y0xgdZ2E1hQykqOclVVFam6hl
 24MvJgwA22SPEtkA0mNrYi5NpBKzpaQ=
X-Proofpoint-ORIG-GUID: r-U32vedE72Yh4_lVxwLAUj59mejnG9b
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a93a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XXr5AoNkCxhS8z1Gjs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX85o3t5RN9cTg
 kQxQEhwSnc+B02Jou9kUSgelFzOxap3X9v6EXQLjNuFpdZ+tsIEdkYTs8nIE/nRP+SRm33QYSXq
 menVPr/EN6M3pqicXi05vU2zMyDpxdiQoq8anLq9rkVAiDfln2zHOjgTKNl5kHxBLUVl5/VgDXG
 gzjd+05XoUvvOTZHPwqUwszqL4tqdSnBi/H0l7KAJXTIQjQV1515VWAWs82g1Y+ktXdBverC/h8
 9tvVCWQ9tcpoHSV/X6EecTKQ4t8s0/ICIcR1y7hHi360rwUqjrG5smRH4N5ZhYoVpBJ7HG37pX1
 f1FIN0sY8/OTJaJc28GKNy092XEXv1/uaqATSFHEshG2t/wigwUBff0a/0h73gvbt8m2yIQsCXp
 F9utyb9vO7KabfWO/l8mwGggyW4yVRWG3XQIKtlWkHge7geytnFJh4UEtRrWgiMldVaPBXvNf59
 7IzhF681I/pZi8F0gQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 2904B6710EB



On 11-06-2026 03:10 pm, Konrad Dybcio wrote:
> On 6/8/26 2:21 PM, Imran Shaik wrote:
>> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
>> SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>>   
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>>   
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
>> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>>   	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>>   	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>>   	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
>> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
>> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> 
> Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?
> 

Yes Konrad, as per the hardware connectivity, RF_CLK1 runs at 19.2 MHz, 
while the other RF clocks operate at 38.4 MHz.

Thanks,
Imran

