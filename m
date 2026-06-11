Return-Path: <linux-arm-msm+bounces-112572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KwQ2IxAjKmqkjAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:53:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97F66DE51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FBF0Ql0B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=asY9f1oE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112572-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112572-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A69C307CEDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 02:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB0E30C619;
	Thu, 11 Jun 2026 02:51:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983D233954
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:51:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781146283; cv=none; b=PRDxC8TZieY+bmF/4fiRyOB8KeR1077PkH++PWWSkaLX55Dut3JAkLuOojWpKz+eCn9dEzDs+3DCIjYtM4MaPEnL6FjR/0DsNLLtzI9q+XPd54qtlGPEvshyyTYdcsyB51uxVTT1EwVzO5isDCi7TxJNoic54SbJiDfAsZcz6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781146283; c=relaxed/simple;
	bh=Tz1ulZG0shDbUKHRRCZjDO1TFWCM5ai0hOiEfQQ5vPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twj5Z9gOwog3TUa7TN6mG+5S97F8BldIOAkyaKzMK2cY6VQkBI2/jCO7/qJh+FC6mZGiOnOPShiDcYllJUCsyeWx2hD8Gc9VTeUvFWFUK/R+wbQEizlYponl4ZGloRR5fC2+GVMPap+ayYPJ16KUCYZltwHTwMnhftJ4/fP8poA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBF0Ql0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asY9f1oE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NmBY3082981
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHBxs7+9QLUj/bpBZBZLouB8G/2H/8d3SUeftgiCbMo=; b=FBF0Ql0B3381QVHL
	0FHl8sMYBWJTQTJqObMbS6czKJw/Ge/GXLFTxYxyd3blBVrkKuvzMEEexVc01Bxh
	uMgiBBCd6mk/6BqKkEVSyUkXOn8j8qVeYTVyNmg4ZgXhlKYLEK2p0Etpl4tjEGIn
	SyjlTqSQd8ohKZZWqYg8DS7nfzsUNHEVUvk7HHkKl30LEOaZMOcmKpo86k47Bxtq
	i2JIBoa4Rs5N8J5CHN4N4vVXkaEhj+FpCwA5hvJLisnHIoiS+W/1RU/dOjGXs4e6
	Nzc56APYfLfb4cb0p326L1TgEedIkpPzQn6QSxFSGmSXFRLo2cAktWVC6q3/RBjX
	fywwGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u99t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:51:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156cb14b1cso646975885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 19:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781146279; x=1781751079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHBxs7+9QLUj/bpBZBZLouB8G/2H/8d3SUeftgiCbMo=;
        b=asY9f1oEgqzo+ffUkl3P36I7Wv6dlSt3PMjQ7l/qKrOme6ptac4jgblGCpPS56zSNQ
         SfCf5oZKC+50kABnMFYdHGeJlELC3XnOz0T7d8PJRvNkumDb3uCIlZpuy8anRH7S6YF+
         K0DgkE7II9CxbB8LgXu2LNJfsJu5DSkVH3YOfWQQvmmdaz8AqOgYbIZWQ1MpvoEPkJbx
         arugDOzaCR1tFFXT7AQNfl8Y7VNhvo0IWQjGtxIW8oXGlR9mSEu7NROv0ej2ywkd/ncB
         bPQcF0sQKVNuKmPuFm7tHm9S7OyYxvYjrHPjUTDZTBIreYUMal1r28hBYvG2DoDrR4e9
         xVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781146279; x=1781751079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHBxs7+9QLUj/bpBZBZLouB8G/2H/8d3SUeftgiCbMo=;
        b=ncEHky3ZqCEC2Aid6ysX017O54mbxNR5C6Lq0BlxdY+w96TfAmqPeQBtiM0hzSpp1d
         IKLKSTptUh6VC3rxzUWkqHCqmAONVvu2gJyVbFKZnHPL20u3Zzt/g/ORdL7GOdg/pb4r
         HiqeS79mjuiCsMsZZAwEpO1yn/uRis7s0I9XkZyGOyRZinOjciBHveYC9OLuLgbnciMu
         0jVmR2VIKWTPO5soG9E/fuIE9TpwqBK1WKe/yKtcdH3xWDA4cM9Uhw8u6K/7eQ3uSPk1
         PZPMPPSGupGVuD97LdvOqUCyrnI1mHBkmUArLAMREjEF4/uO2SI6164LrybHohiSY+96
         kaOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/F+DQTV/mtW9wNSxbmpAcQEjvmJ4UMpayeaMNNWQQ3lhELvgVaQkChW/4vPHkyyRx7aQ4ghb3i4yoPko+@vger.kernel.org
X-Gm-Message-State: AOJu0YyAi3DdYuD71MxjpnfiYaovapdGYtG2aWHVb0V8hEuuhWxmVDds
	HK9UwQqBJ10ccJKA//NUrZvz1feQwT/8o2Bic9pJzmYVSeu1WUPDxV3L3gldBlT5wHf2dgMwjnM
	Hu75d0G7Kd4pgRmVjd5gjZ+XnfRYM/b7oxjp2sQ52LHuNs3LWtORheavoA6x/ZB9Pg3Vw
X-Gm-Gg: Acq92OG3uTgj+FKVACnNXO0fP+o/cHlXiOG7OaQ7y6lq9KIEILFweuYa83lPRiSgbNi
	GZ+AvPZPtEB0U/OkriI/v9v2PDHtBirV4w01D9SWvF/fdoPc16/KbpP+yNYaBKMhQkqg4qCSwZj
	RTStg8yDTAB9Jt1p3cvPE5qp21+A0NO7EYDvEQ8jsVsONZmtxBW4GtpeywIwt4C1DuJfai1g2uA
	bRQvUf2QGgr7JSob9iwSFgJlIzEX5cfWAKyN5E53fVjDf9aK3RZ9KOhu13ygUcPQFh6Z2wHuWuu
	ZWcrMnmzC8FzJfEVWbU9X1rn54pCY+IgGuiCYTI3UPIpJ54QCU0Pa2agX4g53fNoHC0Wh7pH9kG
	/WaqRfIV7N87sUMgTo0I9nShOl3rt4eoCsVXrWwI5aXfy5oncfj+T52sqQHc=
X-Received: by 2002:a05:620a:4694:b0:914:c226:ece1 with SMTP id af79cd13be357-9160ab126femr113094685a.13.1781146279246;
        Wed, 10 Jun 2026 19:51:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:914:c226:ece1 with SMTP id af79cd13be357-9160ab126femr113092985a.13.1781146278767;
        Wed, 10 Jun 2026 19:51:18 -0700 (PDT)
Received: from [10.239.31.31] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160adf5118sm52610585a.24.2026.06.10.19.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 19:51:18 -0700 (PDT)
Message-ID: <f7fb6e2c-839f-460c-8d35-2d97417a4636@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:51:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
 <809ea8e8-c95e-4200-8d2f-1a0354cd523c@molgen.mpg.de>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <809ea8e8-c95e-4200-8d2f-1a0354cd523c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAyNSBTYWx0ZWRfX6wGJ8d0Y+jbL
 5cfRA1cgsdBLPqT4fVB5OJ9JCrCY7nKg25YfZ3fL+T6kVNbSJUqlPtWIwtbqkhCdZDisOILvPTg
 p1cB44cVuKP2haR1UF/jIyIuz0iOaFo=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a22a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rKUSNSVDhnp8xo2j1PQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAyNSBTYWx0ZWRfX4MEroBr7a/t9
 WyUrm7bmJQBkxdwzv4zsp0ciEHylPYWylWNC+aZQrtQx0mAUIU1Yf1M07cSpjYWKAkttIA5KX1p
 MWimKY7ZCmXhzmvRw+esPiAWK/d2wSkG3BKWb55g6sHomMt7tiU3mkIA76T41j4kTChvK7pXhNO
 ycf6u7qPsNdrVoKpck+4cO+JIHREVvdA0T0vJEOWeQnVDQaEFuIV+Pb0AedOJDm/gpWl4tD9MJD
 3pmJnO8C1ml5P6axBwkSgsLVz9DqD6jecocoT/y4BelGMd0yuF/WSWmXlBRoiHJEbS8kgrHS4sh
 XG+RliBBuKV2apfwn3LArMe+QTzDwhy+1espcfbWGvnH9sKaZqBRofS2F6ad68akICCryrc8YT7
 Md8AXYLJMUxDoF08grIG0+B7HdKjm/FkBWVxdgL7Qw21z21KIM0JegrJFRbq/L9/sOAyQ4GX2SC
 FP/v3sF7NKaKCXkfAzg==
X-Proofpoint-GUID: YxQAXvXdOkRl0fu1n3mbdQa7yyZTcNGo
X-Proofpoint-ORIG-GUID: YxQAXvXdOkRl0fu1n3mbdQa7yyZTcNGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112572-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:pmenzel@molgen.mpg.de,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE97F66DE51



On 6/11/2026 4:54 AM, Paul Menzel wrote:
> Dear Xiuzhuo,
>=20
>=20
> Thank you for the patch, which was applied today.
>=20
> Am 10.06.26 um 08:42 schrieb Xiuzhuo Shang:
>> Firmware version is critical for bug triage. Users reporting issues
>> typically share dmesg output rather than debugfs contents, requiring
>> extra communication rounds to collect this information. Log the FW
>> build version directly to the kernel log so it is immediately
>> available in bug reports.
>>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>> ---
>> Example output:
>> =C2=A0=C2=A0 Bluetooth: hci0: QCA FW build version: BTFW.MOSELLE.1.1.3=
-00106-MSL_PATCHZ-1
>=20
> Please put it in the commit message next time.
>=20
> Also, just for completeness, could you please paste all the Bluetooth/h=
ci0/QCA logs, so that maybe a more condensed logging format can be found?=


Hi=EF=BC=8CPaul=EF=BC=8C
Thanks for your suggestion.=20

root@rb3gen2-core-kit:/# dmesg | grep -iE "bluetooth|hci|wcn|btqca|btfm|r=
fkill"
[    5.159228] sdhci_msm 8804000.mmc: Got CD GPIO
[    5.219919] mmc2: SDHCI controller on 8804000.mmc [8804000.mmc] using =
ADMA 64-bit
[   11.806187] ath11k 17a10040.wifi: wcn6750 hw1.0
[   11.818575] ath11k 17a10040.wifi: wcn6750 hw1.0
[   11.823714] ath11k 17a10040.wifi: wcn6750 hw1.0
[   20.284824] pci 0001:04:00.0: xHCI HW not ready after 5 sec (HC bug?) =
status =3D 0x801
[   20.338018] Bluetooth: Core ver 2.22
[   20.341805] NET: Registered PF_BLUETOOTH protocol family
[   20.347310] Bluetooth: HCI device and connection manager initialized
[   20.347327] Bluetooth: HCI socket layer initialized
[   20.347333] Bluetooth: L2CAP socket layer initialized
[   20.347352] Bluetooth: SCO socket layer initialized
[   20.479734] Bluetooth: HCI UART driver ver 2.3
[   20.496850] Bluetooth: HCI UART protocol H4 registered
[   20.515949] Bluetooth: HCI UART protocol LL registered
[   20.516004] Bluetooth: HCI UART protocol QCA registered
[   20.528204] Bluetooth: hci0: setting up wcn6750
[   20.699447] Modules linked in: iris_vpu(O+) nf_conntrack audioreach_dr=
iver(O) qcom_pbs nf_defrag_ipv6 v4l2_mem2mem videobuf2_v4l2 snd_q6dsp_com=
mon qcom_spmi_temp_alarm qcom_spmi_adc_tm5 nf_defrag_ipv4 qcom_spmi_adc5 =
rtc_pm8xxx qcom_pon nvmem_qcom_spmi_sdam videobuf2_common qcom_vadc_commo=
n videodev iptable_filter hci_uart ip_tables btqca gpio_shared_proxy x_ta=
bles apr mc msm_kgsl(O+) pwrseq_qcom_wcn videocc_sc7280 phy_qcom_qmp_comb=
o dispcc_sc7280 coresight_stm camcc_sc7280 qcom_refgen_regulator qcom_sta=
ts spi_geni_qcom dwc3_qcom usb_f_fs aux_bridge stm_p_basic msm typec gpi =
phy_qcom_snps_femto_v2 qcom_eud icc_bwmon bluetooth stm_core bridge ubwc_=
config coresight_cti coresight_tpdm ecdh_generic stp kpp llc overlay ecc =
libcomposite ath11k_ahb llcc_qcom ath11k snd_soc_lpass_va_macro snd_soc_l=
pass_wsa_macro ocmem mac80211 qcom_q6v5_pas soundwire_qcom snd_soc_lpass_=
macro_common coresight_replicator gpu_sched qcom_pil_info libarc4 coresig=
ht_tmc qcom_q6v5 drm_gpuvm snd_soc_core snd_compress coresight_etm4x qcom=
_sysmon
[   20.791274]  coresight_funnel qrtr gpucc_sc7280 qcrypto drm_display_he=
lper snd_pcm qcom_common sha256 snd_timer cec qcom_glink_smem coresight p=
mic_glink sha1 soundwire_bus lpassaudiocc_sc7280 snd drm_dp_aux_bus mdt_l=
oader libdes pdr_interface pinctrl_sc7280_lpass_lpi cfg80211 drm_client_l=
ib soundcore qcom_pdr_msg authenc pinctrl_lpass_lpi slimbus pci_pwrctrl_t=
c9563 rfkill icc_osm_l3 socinfo qmi_helpers display_connector drm_kms_hel=
per qcom_rng nvmem_reboot_mode sch_fq_codel fuse
[   21.170589] xhci-pci-renesas 0001:04:00.0: failed to load firmware ren=
esas_usb_fw.mem: -2
[   21.213198] xhci-pci-renesas 0001:04:00.0: probe with driver xhci-pci-=
renesas failed with error -2
[   22.627369] Bluetooth: hci0: command 0xfc00 tx timeout
[   22.639919] Bluetooth: hci0: Reading QCA version information failed (-=
110)
[   22.652097] Bluetooth: hci0: Retry BT power ON:0
[   22.706596] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   22.719197] Bluetooth: BNEP filters: protocol multicast
[   22.719204] Bluetooth: BNEP socket layer initialized
[   23.123401] Bluetooth: hci0: QCA Product ID   :0x00000015
[   23.132217] Bluetooth: hci0: QCA SOC Version  :0x40140110
[   23.150091] Bluetooth: hci0: QCA ROM Version  :0x00000101
[   23.155714] Bluetooth: hci0: QCA Patch Version:0x000024c7
[   23.165303] Bluetooth: hci0: QCA controller version 0x01100101
[   23.172966] Bluetooth: hci0: QCA Downloading qca/msbtfw11.mbn
[   24.193137] Bluetooth: hci0: QCA Downloading qca/msnv11.bin
[   24.325620] Bluetooth: hci0: QCA FW build version: BTFW.MOSELLE.1.1.3-=
00106-MSL_PATCHZ-1
[   24.335237] Bluetooth: hci0: QCA setup on UART is completed
[  287.493900] Bluetooth: MGMT ver 1.23
[  287.498546] Bluetooth: hci0: setting up wcn6750
[  287.562270] Bluetooth: hci0: QCA Product ID   :0x00000015
[  287.567880] Bluetooth: hci0: QCA SOC Version  :0x40140110
[  287.573507] Bluetooth: hci0: QCA ROM Version  :0x00000101
[  287.579290] Bluetooth: hci0: QCA Patch Version:0x000024c
[  287.596249] Bluetooth: hci0: QCA controller version 0x01100101
[  287.602763] Bluetooth: hci0: QCA Downloading qca/msbtfw11.mbn
[  288.629814] Bluetooth: hci0: QCA Downloading qca/msnv11.bin
[  288.751030] Bluetooth: hci0: QCA FW build version: BTFW.MOSELLE.1.1.3-=
00106-MSL_PATCHZ-1
[  288.759441] Bluetooth: hci0: QCA setup on UART is completed
[  288.834672] Bluetooth: RFCOMM TTY layer initialized
[  288.839721] Bluetooth: RFCOMM socket layer initialized
[  288.845032] Bluetooth: RFCOMM ver 1.11

>=20
>> =C2=A0 drivers/bluetooth/btqca.c | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index dda76365726f..04ebe290bc78 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -143,6 +143,8 @@ static int qca_read_fw_build_info(struct hci_dev *=
hdev)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hci_set_fw_info(hdev, "%s", buil=
d_label);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 bt_dev_info(hdev, "QCA FW build version: %s=
", build_label);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(build_label);
>> =C2=A0 out:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree_skb(skb);
>=20
>=20
> Kind regards,
>=20
> Paul


