Return-Path: <linux-arm-msm+bounces-112696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZhnMEPaJKmoGsAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:12:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAE670BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:12:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EuYgqavH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HD/k18/h";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1362E32CA4FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE123CA4BB;
	Thu, 11 Jun 2026 10:10:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF807375ABD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172624; cv=none; b=dmK1ixLPEo6iCYwiwbVZe4BS+gNEmiqS0lPF1z9pUw2xI/yRksFZRMo1GmLBoEFZjBdCIesk2F9OtZ1ZfDDDEl5foj9D6u0AhSks1U7+OaTHif9RFnVPCBTGvVXoZhDBkxJPLs3aARLyd2pqFqXfhPlVA6a2/Jbj7+LgfHa2+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172624; c=relaxed/simple;
	bh=qwwBqiUVQhsEEk8IMHKN6+o4JIzdec3YADBMvEXeMO8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OB8eIvfTwk71aS1Jm85phDZIZ6WUzJDEm5x+nerKrn8NV/EpHCUc1gxTrqoQc82Sq60ZPq424OV+KzuHRU0BpfBuJSkFJ6e26Qc98xxK2S7pK5quJ8Ub6kwpm9WSalT0bCyILlka6oWIEl5x66vhK+o1bg7X5Hm8/2D2GReUn4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuYgqavH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HD/k18/h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1oqg271441
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YqRP6zDTIs74HF9sx2xYRh
	n3mKkqsdODgZ5PXkmDO38=; b=EuYgqavH13xCJ2sM6C8hG8QMUEv63rc4IhGRI8
	hbfmZvSjD7I6DULRbBKLVF84YDgkkPmrf8a6jghvzXG0wYx9S4nV9E7SsVKOJNdN
	36EpJhZYPlxrY77LJkVtH5nDtRZizzm66xxOccNWiY/4JLZnJyh2jc/Kleer+ybC
	ev7SVtM9cLLE/0wYssJ6lgoA83+yQgVEjrnxHm++siO4VYc3l7gWYLCpwJjMKMG8
	ovwxvrVu3HbRiJU49b1bbD0ANlBDgRhfdjOaBDY5afY0Pj3uyW4WaxLiWXICzc5A
	z8jYciOlXRZNP7EjDb11zojeZPUvNrk6j5wF8PeVNDlJ2ong==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71jy4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso3453115a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172621; x=1781777421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqRP6zDTIs74HF9sx2xYRhn3mKkqsdODgZ5PXkmDO38=;
        b=HD/k18/hYk8jwhCdZUm/ueIw8GDNq/J2bdMhfe2HcZiLzunspe2bCEyogPzXvs2FMZ
         A+3Z5p00RnZ+PLpfoTZPs4bN0x/1X7BiZPU0zSvXNyoA3vmq3gPvwAAUHuf3RVv4dnIh
         g75pjDMwfHIInTX8UE3yFAItoS9Ze8OiZ6eI0v0nb/EZ5rzStAQxyatcfjQCaUyMBcsp
         zjG2YPBB+IEZycfoRXJpjD6yZL9utSvTAzOVsY0GQ3YOWGKEHjIHNF0uo1Bqa8B8NLht
         n064oC7/1GMZ/6f9UPhzBm2vGQsX2z599KY1Wu01q1yzGLrUPrL3dE9Rp01mw+At5BjK
         qkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172621; x=1781777421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqRP6zDTIs74HF9sx2xYRhn3mKkqsdODgZ5PXkmDO38=;
        b=MvdBTqf7rp2WrijE4S7ukiaeHcncuoo3RW6OrkCpShVTO5sCUdhQKA15GCSgCdFcDG
         cjdFfRYHaBbOIlQ9PNaPWWIS8RrH4ujAvixdInshiD5zYgXVdJ+ty9M8KzuRMXn11kYy
         XngofOBFLzZOeABojWuIrPENRTeCs4wD65rZDPi2BfmcM1b5s0QgpGwIQSJG5x57g3X7
         f0OGY5Z7EG6WaNTvx2or79gHI+FjEDjb3YM3G/YCZ/CfESbORcMY//LYmtTVh5RZp3Bd
         R2sNrIplASxXkWU40yDrs4NlALfmeypEijtR5hf+ICv8uQhOAQG8TOjRMsLDUSbg+0t3
         ODUA==
X-Gm-Message-State: AOJu0Yy4fj4O1yscXaKe5WJ9KkJvKVk96ChugS9FeiWcoftpeD2aTUvL
	k7JpLiypieILNYm21+IkH3Sezb+OzJ/RwmgB3sZIDTPrFgbTey4mxYLqy7efePF6+xnwV7E4XYy
	WmXMyk+3jfXCea33aDyJZVudEnN3BroJr0v+kSYTk81s1OKh/sUveVc2zSvOATXZVam5o
X-Gm-Gg: Acq92OEsMSCHoZrDGfQZDOxWm2K6KsfH9UZJnMEb3n8EDFbzUrooqea5cululo2EMsB
	Yh/4eXAmPrT46DPCvUdwXTlG5+xivbo/0BhY82LfB8+HvLntJ6FOUZx5i/XcKBd04iVx9Cx7j7u
	Oz9iqU32dBkgxcPKAZmM8J6E4eqagnMxsgE0lNx37/HrwINVCO2yZznq6mXspUstUKB7tAk5kW1
	B4obasU3Yp+UUo22PRxtAUo1eet92sFtlu3suJGSko7waHXyeCl62BdZjK8mG2/s1Ac1DfCG4kT
	aYKhoEZ+ntdq4p3TBfq8495kD8vhDupd+rVqwtTBEzABLjLmNlRyQTb+Caw/2zBw1TnGq9UYSq8
	5d/43ImkLFYf3UJl5ByeosNAlWfxUu1VhbeTYoQQ9yfDz7c0=
X-Received: by 2002:a05:6a21:610c:b0:3b4:80db:f1b6 with SMTP id adf61e73a8af0-3b5e3191983mr2487548637.6.1781172620582;
        Thu, 11 Jun 2026 03:10:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:610c:b0:3b4:80db:f1b6 with SMTP id adf61e73a8af0-3b5e3191983mr2487508637.6.1781172620116;
        Thu, 11 Jun 2026 03:10:20 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:19 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v5 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Thu, 11 Jun 2026 15:40:07 +0530
Message-Id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+JKmoC/6XS207jMBAG4Fepco2R7fExV7wHQpVP01o0SYlDx
 Ar13ddpC5sVIJC4sTRR/i+Z8bw2JY05labdvDZjmnPJQ18LebNpwt71u0RyrHXDKVdUMkbKPj+
 OjsSJRC2j1UIKJVRT3z+OCfPL2bp/uNRjenqu5HR5+E9sN2dPcPvm7UIg47GrZzg8FsKpFSkiI
 njaznLhu1SKW6clNdf0tnP54IeXrevjtirby4cKmYEwoqxBkyR6AHs3lHL79OwOYei623r8Qub
 fyx8aBvrWcO5SR3zuY+53xGnvbeTIVOTtzD6LSvo++xLWSUSJzkeKP0hOoYzv0TpdpoxNglp9j
 XpXElkayFO7cT4pyQzo4MEK1CpqME47LTRwjsGBR6a9a5bL3ucyDeOf8x5Va7nt68rw1crMjFC
 imRJgAGiM9OPUFmzma8CuAV6BQJm3FL0AK78AYAXw//4AKmAoYkzGQQziC0CsAb0GRAW8DI6ho
 3Uw/BPgdDr9BR4b6bZZAwAA
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=4628;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qwwBqiUVQhsEEk8IMHKN6+o4JIzdec3YADBMvEXeMO8=;
 b=SeTICSgt8xeYx9/zvEW0plaXxOwnexE1sXl0CQBgwnTqRlBrb5+SzSC2VALH4i7BTgTh6R/iI
 0GFuY6GnlLjBVeKljMqXqvoIs99wLs8oDejlH/Ekv/dS+SmFmbi60H5
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: NutdYs0Ux9n04abxafuhEr1A7xog9Z1i
X-Proofpoint-GUID: NutdYs0Ux9n04abxafuhEr1A7xog9Z1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX/EUlZSItYlL+
 MrbPEwo+e//uEgiz31LUM4oFSJd7JaHQ5rhXqOYX5Jo2YrfxWJ/peiI2PwPb44Vaw0k+9gmq2yQ
 wUSKEtgN1aOZCb5pO1LQN/7qbRQy7NHwK4BKMkag3vRNTCaO2fjeeBEtttpkwimLzRYB4Djrgdg
 iCoxkCcE9SXPl7qhwiE3HhmDm9ACg4qjK1OIh7ckL03m/dhXUAj6qDPfuPu3FdgcgbIbfNhcTgP
 qROxObWRI23NE0nQ87x4InZKaJKEhyD5xM9eq5zFIbu0bILNsnE2VHiLA2JkjUhi+COVKso8/rC
 bEUYFLPo740oN1fWPHc/FC/2PK7gWuizizah6u2Yxdo3qUsvft1SXIBw35xD7eriKAPtQfvx02j
 5BzUov3PFtjIpAXpaDTTZuS1HrV2Pur2QrSOJGEZWRFekwI0vfphysjKWfJ1QPxCUH28lBW00Pp
 zYBM6V2OtaAZiIQF/VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX2NrN1sp1q2+D
 bnaEJGUpTBKrE5EOhUQ7zvf/Pgl7y39onWcy67MZs6GfIfGQf52rgWAK0MRjb9g1HU3SZ2uBAAH
 HDQ8lLtsLNPaYItKD/Qladm4CecYEB8=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a898d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=thxruFBVZ7uuMI2BP_UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EEAE670BAB

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ2390M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART and eMMC on the carrier board

Note: USB support is intentionally dropped from this series. It will be
sent separately once the USB driver changes for Shikra are concluded.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v5:
- Add qcom,rpmcc-qcm2290 fallback compatible to rpmcc node in shikra.dtsi
- Link to v4: https://lore.kernel.org/r/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com

Changes in v4:
- Updated commit message for 1/5 and 3/5 (Krzysztof, Konrad)
- Incorporated Konrad's comment
- Collected Reviewed-By tags
- Link to v3: https://lore.kernel.org/r/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com

Changes in v3:
- Drop USB nodes from this series; will be sent separately pending
  conclusion of USB driver changes for Shikra
- Fix memory base (0xa0000000 -> 0x80000000) (sashiko-bot)
- Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
- Fix INTC GIC_PPI number from 8 to GIC_PPI 9 (sashiko-bot)
- Rename SoM variant CQ7790M to CQ2390M (Konrad)
- Add PMIC DTSI includes to CQ2390M and IQ2390S SoM
- Link to v2: https://lore.kernel.org/r/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com

Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 156 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 170 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 842 ++++++++++++++++++++++++
 9 files changed, 1324 insertions(+)
---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: 20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-message-id: 20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


