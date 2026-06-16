Return-Path: <linux-arm-msm+bounces-113316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hyPaOSu9MGpHWwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:04:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6A68B9AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:04:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F9ig1rOA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AR0R6J1Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D5FA300BBB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 03:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6419E3C37A3;
	Tue, 16 Jun 2026 03:04:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232837C0F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:04:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579045; cv=none; b=eY2BlSier0CYwgnHTR3ULmAaJ4dA9hFhleXMBQgdXh15fKYcpQkOWKtX4/JYdmyz3PqzpfmvNM21spZWK1DlOR5PzKkbehqrT8EG3rI4hzDAODVzdWkDcgrgmhHkuGIU3k+kVNcO4p2NNJOwG0T4YaaqrqWrcChPKlkeRKhVWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579045; c=relaxed/simple;
	bh=aY+9+MdKna9M5CJAz5t8sHyWsdgO1hXtr9iBaOmS6fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bl0EtncpKmHooB8ZYoYGFABJNZOGou0avgim72okyip9Mm15Mduebs75eUXjwW2byM/mdGCPiRMU+yTv2sB5fg/rly3o2onCQPKcLONKZsrdmGIYfQ8eMGwX+MP6RBGzd+ReS24BVeuyznbL7wvfTL3NM72+giK566A7ewAGiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9ig1rOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR0R6J1Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xi3x2361830
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8zG4ij+zNAg
	8aexT5VC3GGKsuDLynsOlxhclh16ESQM=; b=F9ig1rOARCjw9E4BR+5c9yfyysI
	lxrAFpSYJS5wom0+ojGT4qh02JoP/y/CI/G//RMQdNc54tlx+jxu8m8gChbVtjKa
	YT6T0piam3WwXCwuebSq2vVc3r7lDHE6Qw/3eUiI6tJwra7CjfdqN6EwVl03uCiI
	BRZyibEmowjki+dWb0fl3FUhM0srPOPOe5GAXFWJO8/XmYX19i8JYJVCEYERsgbL
	jbpLpCOlgRYJzlwmT4chtqR2dpZG4s/4sRlc32WmekEFOOlDZTyKGLllnpsARfiN
	7nfWbe4Trr2kuxw9R2Dzj9Whc6zAguUPFcYpvz5uh66wCBA1/qIM4pgHcVw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2ccxhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:04:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f3041088so222826c88.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 20:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781579041; x=1782183841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zG4ij+zNAg8aexT5VC3GGKsuDLynsOlxhclh16ESQM=;
        b=AR0R6J1Y7dndSLCoj3smWfIsuVuiK0P4/EJyCB0xlkCIysudldPwJmY/cqhjlojFrP
         JzjqmTSBuCPYNxeiQrMJyP+stqAfLr+HQB7G5GTKPz1lNdVVEsIO/7dTjQzbclLuIyTU
         4/dgk/2BT82fEUn+7GHwVXWiYG362lZ/+o0zs2ITRn+FZ5ShhJaZAUltWS0Bnt81/QRr
         AGR2/uOXV6YkuRafRsBQGKQJwfbeO3aBosW3iX2vA8ZInklYQA6SKeuSN99UsGW0r7fb
         8GEgz3kDzvgjl61tekDU9Ztnyapz2nx18FQEYKbAXSlmLL0bxNZxTHzeg/i4GeIdE29R
         pxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781579041; x=1782183841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zG4ij+zNAg8aexT5VC3GGKsuDLynsOlxhclh16ESQM=;
        b=OEg/PMbJTZGwWy62wFSfxhJ5lKtcEdi9jwkSJatfH9mC/TT5nPH+z9g70f3thMfvqP
         0JV/j9jaayfm55hCnuodvbH50BnCxvpqEwFKpX9Zt/m6xlTbc9Jwa5jouB48mnHVSle5
         Z9wT41s20ZGeA74kEBJnhhNew2kPpCzZoqVw/2X0FJiaEvxlmlA8rNvhtnA+0dNU+4AK
         HV/N6FttYuJsLDL9FxGzse3J69dwq77nOK/WAdgz6Je8DWhkJBdDPhdt2lma8de+joRD
         X6tqLl40w1YmHpqyY+v7HSZmGl2qq7Kw2pXs3dT8KqtRl++cToPzl841/r4LMG0bExGD
         AW/g==
X-Forwarded-Encrypted: i=1; AFNElJ81aeoHNMAcfxFafbgz1UTDSI0A2rmxPQY8zi5KJXxLkDyXyo611VuVQIY03E7/UauMm858/nA1cSNaFL18@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cKHj30zOclEV0jQHqMAPzRY2Rl9RRHRvLYpqtCeWAF3fbMOq
	uAz3wtI3p2nFkRib1uTc2DeUN87ezD98qop44Ph69W9zE89tMwDlT/t3/HKMo4d7gOSLB9iB16V
	KXC3FJmhc3EBNlqle0qBMspy72zKX1L9VsuFJu4AsimFNXcpPO3QE4ngmq8uPtIFWVv6j
X-Gm-Gg: Acq92OFQpJWDO134mfXWYNRG6//c7/uOz/HQtslEmzWi97sXAzo46lTzLC6i+C22Rt3
	7SorpGa+B3yHdNU+iV0Wt6Uu8jY6NSf1Elxv/Sk2clWpaizGVo3YjkGSkqKgwJUCvak0nAF07uM
	U1mG49LsdKjCxGdxw8BLdcf3gMC1K9sQq+16bQMbGkAwnWe/UhtAksGL6qrWWd1xRMTHh4V5C6C
	1IwDDgZkSMYF6D+G9DAO0MAFQfqZi67JwEiWL4/EOuNB2cYzoqgXd4OunY0KQt26A0OF0/Qod/H
	t/9qIZt72XQMhp+koZxpEA1eEFcaFJ/SJMxcPrhJaF0zMd3HKBJPOALwVwg9nXutx4iWFB6x2tl
	EZWkXQqZRqc19fxxpkbVkthajq3A3w4IQkVUwNiCIBscux9NNy8W8ycjX0DOBVxihcE2tL8Ob
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id 5a478bee46e88-3081ff5d099mr4747159eec.1.1781579040763;
        Mon, 15 Jun 2026 20:04:00 -0700 (PDT)
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id 5a478bee46e88-3081ff5d099mr4747139eec.1.1781579040209;
        Mon, 15 Jun 2026 20:04:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm18012843eec.0.2026.06.15.20.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 20:03:59 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
Date: Tue, 16 Jun 2026 08:33:53 +0530
Message-Id: <20260616030353.3701326-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <hndyeomouu754rwevoigc2ai4ywtz5lhodizj4amjuyn4azjhq@f6ixgilydtg2>
References: <hndyeomouu754rwevoigc2ai4ywtz5lhodizj4amjuyn4azjhq@f6ixgilydtg2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyNyBTYWx0ZWRfX/Y/ger70oMiZ
 GLlv8G750p5gtDCTsvzwiybeGkzrzKjeLjR3uxDLiQXgfqxWBRMG08PlPC9ZobTsKLW/JAe4cVJ
 xF7RBOixG2fv1+hsev627r8/ltLkTMSpZ6VI9dgkNdRKoHDQyAK4tF8gll8hwfqkAo4vLGZrET9
 AmcjT4cJqAJYOe4kgtiHjP6d1cX8zYim3OsxtY7EVEDI2yYctaB2gc1a5j7v+DZJ9d3uDJxrTJP
 bBaqn/Xone/icAhAPXUWOJ+wNFkWxUejExFHUsiYivtwZbPnpRUyzPgY3751MT4OiTimalRIp6C
 BnoAkwiYliV1rJa7V2MolYSZxJCQ9Ktj/y7ry3LFcYZEzfLSo9R/snwPiFf0wxza5H4O2x0VBWU
 67Yib7XCUl/7K8EMUaYZdCdHljKHQVgFqTW2c5QRB824bnUHc8kOeXY21wbiJU2rWr/JqqXdz85
 1yjjk7RICHrfqluH2uQ==
X-Proofpoint-ORIG-GUID: PGJLtJvh_2BpEpCtejfEuUjeHLfqjyvN
X-Proofpoint-GUID: PGJLtJvh_2BpEpCtejfEuUjeHLfqjyvN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyNyBTYWx0ZWRfXwUZS0/6u481J
 +ydiQ1ia81H7fOBQRjHdM75j371L2RF8xh55RZOrKvxtI1/v1ztcEgaBwi8Be1pJwSZddczw6Qt
 Bdf3RNmios4lYUUJUJIUPPOCKYL1iQA=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a30bd22 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qxZblbheq-ph8u31yYUA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE6A68B9AE

Hi Dmitry,

On Tue, Jun 16, 2026 at 03:26:40AM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 02:47:01PM +0530, Wei Deng wrote:
>> WCN6855 is a Qualcomm Wi-Fi/BT combo chip that uses PCI device ID
>> 0x1103. Add it to pwrseq_m2_pci_ids[] alongside the existing 0x1107
>> (WCN7850) entry, so that the pwrseq-pcie-m2 driver creates a Bluetooth
>> serdev device for WCN6855 cards inserted into PCIe M.2 Key E connectors.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>>  drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
>> index efeb25ba9c79..b3af14464314 100644
>> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
>> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
>> @@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>>  static const struct pci_device_id pwrseq_m2_pci_ids[] = {
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
>>  	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
>> +	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
>>  	{ } /* Sentinel */
>
> Please keep the list sorted. I saw that Bartosz has applied the patch.
> Would you please send a followup?

Thanks for the feedback. I have sent a followup patch to sort the list:

  <20260616025632.3697863-1-wei.deng@oss.qualcomm.com>

>>  };
>>
>> --
>> 2.34.1
>>

--
Best Regards,
Wei Deng

