Return-Path: <linux-arm-msm+bounces-114105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZCkuIB83Omqc4AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:34:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC36B4E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PYyw3NBy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WbVhwiii;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F0A13011F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6305E3C8C65;
	Tue, 23 Jun 2026 07:34:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2347C3C5DDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:34:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200090; cv=none; b=J3zEy83mEQ8Bh+j+PH62dJk0q+ZP462bRRKP/gcwSInL2yXIvv6FanersZ47AXhnpg0q3UsDxEG54TJOe0pFfxFEOzn0yYI3C9aQ/0YdwpcOsqnmPcsNebf7+xbUuSx2fYqwurzgjdxqUdBI+BXKQKPC4UuasKAmEYKwQbxPX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200090; c=relaxed/simple;
	bh=zMZ130vCFWl7DqmQl6TnnSI/sV8pYfA5UZbrwJxA4ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4ilz4Upa1CrZVqTtA5+/C9dJC2y766Cq4CyfGUrCIPN7F5eGrICbyhy7XG57dZbmgFX9EMueaWo91sNCFT+rD3cJDPwAlg4a7P2fC3UgF9L3Ad+WFJ/AsTFO+8Q3zG3+c1U3BwHOzuVopgZvUh/nMsn3MSKHKcp2Ahtft5171c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYyw3NBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbVhwiii; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6daak3631915
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/a
	LGJ/o9YU=; b=PYyw3NByQWyZwd0YO6UP2kkGoVrWpbd9yBLS3FhefteT0KFU/2Z
	gyq627wIc+pquwPTq9y/RG+7r0KGZbptOebUFdcscupODAcQjQ2Sp0qZnIBXwL9h
	HHTx3KYYzaBtunEmxdF3C9PGTdcCybT3jI9sQOz2jiiiE/vSn3wr2pCcPVAbQTCO
	nDzUX/CVuyMl9V4xJk7nX8sFk8vS3JMOlCcUNOmlGB9u3pbu/C8vdZMIsyI+/rSC
	/TcVjZ8nHAyzJKMYLoaxwZGyRADEojspq54qaxTwG+712eyCsiv17DQUq+Lz+GFv
	ipcySYJtofGxvj+PhmUnNP+3TkEZlnbVyOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvr9xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:34:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92045e86763so163223385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782200081; x=1782804881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/aLGJ/o9YU=;
        b=WbVhwiiiwKp+nuiLJH/L0C6novY3C4ty3yeRTdzyXFQzUpgJmg00TF6pJ1b9qlt1HD
         V6IuxKaXS3klFvxWQrh0jK8q8uTSeaNTCKI6ppv9sndMD+u7Vmexbk2+Bq/yZABSOaBW
         X/swv5attGHUzWfwlelyuY6Q/vtt7lbw7GRHY1etuWQafAUiWoXEtGtXvVXBX0qM7jvV
         JPpNq8qcyO93EbPrdwwCYF65x70rfLLvX0VCPJa2io1EOKG41VAtz69QkH0cGriBpuz+
         xB2QQ4KPM5QFo17Q+BLcJOetjmhQ6gB0jBbbIzjNoNGnGzIPy30Or9jsEGFKCnme3sMg
         YYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200081; x=1782804881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/aLGJ/o9YU=;
        b=NkkleN6LcLHGb1SMAri7Q7Cio3L7i4002JF410P2+Hgkmy2KGq5QtFfn78qFpTculK
         J4uDpzRaeRIhecA+7N5bvD7wCbyZfJJ+iNy/7K2PYqLQJvZcT41LZcEMbAwfS5O8RhPn
         IS1aq1ExqFqCq0saUr7JK3vBnksK4xrTymOKUjRTeEu3hh5Sej2MFvOtNzGORSkF4CO8
         RTKOpbSe/aGqKZrGujxcBmCSRY75dOAW4Fua9DKBEG6q2qS5OHE70hWE1c9Upi48CL/K
         qQCrYG7NPdk5pEgyguEtEfD+lqsgKMc7WrFwq54brZTFb8wtxn/Ngd3in8TSfi6JxZZ0
         vwxA==
X-Forwarded-Encrypted: i=1; AFNElJ+XsKZz4HG7M4UyoF5asB5fzCDCv/sy6N/PayyKzy+jEr4vOCWHdrM8QdKQvpSnZfsL5tVjtAtuQTGeKCee@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9TrgPXkRPqFc/1EEfEc91gwOP7vlYHgp4nVG0l+dc+VbSzve
	+Z8K2oWnrUkyWeDEBxPrc3fmizkkCpdAjy+iMo0huQ2J8Vdb5aIja3+AbFL2lTRE1HhIR/QoIMI
	hCF9r/7NeNL02cwQEtr65qJo3v+LGo/zIs9wY0ZGtwNnWD6Wy+BfGdNChyAK8CNMWVRUV
X-Gm-Gg: AfdE7ck2b45iYjwIVLJxJ9Gqeib6dl8SfxX5zodcFxv9vRA3ZTyhZZu3VwlSXFm3hMF
	AVqJxIZx4TSk3xp35/YhH2LhS2LNAwWvY9cnLgAf1OgJ1c0dCFEqDiQZ3GmnZmxtSJ0Uh8inEak
	J4FbeHsbh8I26L/fE7bm/w8XhTiq986WfQp/LGbGrxdAzjG29+YYICfEYg1k8cO5lczYoLdDzDk
	oJenkBYJV0hcQfpmRUsEWx9sYjFOlbiP1ZaXPg7uwQosk81WPjP+2eb6TmPCA8OXGAukaPLztXn
	mtxqig+pYrV6g0i8709prAP5wqor8+t4Vc3eUNapaQkdbQC9G173L/uNBXCPZg+RS110Uj8X4qz
	W3jTIJHG9/yX+BeSNa5ZiSUNXv3Q=
X-Received: by 2002:a05:620a:4613:b0:915:aa65:6e95 with SMTP id af79cd13be357-926039b55aamr440149985a.44.1782200080991;
        Tue, 23 Jun 2026 00:34:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:915:aa65:6e95 with SMTP id af79cd13be357-926039b55aamr440148085a.44.1782200080513;
        Tue, 23 Jun 2026 00:34:40 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e3esm31621828f8f.8.2026.06.23.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:34:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported and fix maintainer addresses
Date: Tue, 23 Jun 2026 09:33:08 +0200
Message-ID: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zMZ130vCFWl7DqmQl6TnnSI/sV8pYfA5UZbrwJxA4ic=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOjazy+CGgsFoC5bradNDUIXivrQCA/T2/GdGW
 MRx1arzdJeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajo2swAKCRDBN2bmhouD
 14WtD/44vRc4VEabogwLpOCsUUaqaJM+sLsM2L0gYyC2whu75RUVBzqqW+HM1X3QE9RstfwvD4j
 UY3DGbOAgfO5U/SVSZIhTUZkmZeIM2V4UD7zbCmBT5lg9WC/FrvUMjE/K7EFY7ax06aapyjPTmU
 bGSCtHrsvOQ2jJ2/j8bWPU+rV+BeQdy1DXXRX/Yq4+OPJdEEmRzVpNdFF/c8Nj9EoubVSfAie/3
 qEBIT8cUqvfQQdE03eC7gd2P4EhYnKXCcYffZ1jCgIEaYAemPxlKn2tYaOE2debWs81WxHI10/A
 6mfC8ezxoCmwuZl0saQLihlRxJqNZKu6OXtnON0mlYcSwzCWtX++PN9YtRwWBf6Z1UwrlD1DGaj
 M0gxeeGvT6akpvq+RnQhLraKQiifbpEse4hWdYRV9ePxFbbECp3/k/EXC4Yq07X+6ufNkOgupDQ
 3ebgZDvDXvCUvMnb8F93VUWnsuScr6hCTuMbvOyCqOXqO0iZjvWpajEurc3JhCdQBiLJ7uOGaby
 GajzsKwWfQpor683BocSqycNSj0Y6lN+IeEcF8M7qloE0vUWrLtgCJVzz+cEhkdOu7a6ePiIeXg
 KxpH90opId7Qmtbug+6wjw8uJYOl8Gz5FANvs/XLVRcCvOvwT3Mkot1arUmngQQMpnVz7v1ExFc Irx0cICn6yzOhlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a3711 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=6yzhs6WGAAAA:8
 a=dlmhaOwlAAAA:8 a=40pjNWuwAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=hD80L64hAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8
 a=9xbOYk6fAAAA:8 a=gPJu0pBYAAAA:8 a=r_1tXGB3AAAA:8 a=yRDnTAKIR_WafuKkSVIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=j5F3_G_i7ziBYwdlbqZG:22 a=y4cfut4LVr_MrANMpYTh:22
 a=coQwfJANHVg1YNGTr4By:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=pioyyrs4ZptJ924tMmac:22
 a=qQLkZBVM-NGEvsx9vKov:22 a=AlIIF0cMT2hfDT4axODj:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX0hyUZ6VdkYep
 RVgh5JLWNrYC8hY01CjXSTvWjuPT4aHcWV5rmEZIShykoPBMsK+2vSXtwfVRN01+uKsicuZjfnu
 29MxU3a+7RMuucukfeUx8qrZE4HggDc=
X-Proofpoint-ORIG-GUID: mSSUaj5yF0V3_WGbh1cb4eylUW9HEY3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX1C0r3/Ospv4Q
 BBOJZr55GHRqQn4Lbhx1senDpfwRv8Anh0RpSkcokoajZlLLLalFn3aAIpAIrg+yDG8LropKXiX
 2cBMi3AuJS7ztf02cKGVdW9vmhry6moj03xZ1QAvVtoliwVfR3z0Mp9RG6yXBOWjXnMA6iIYcWe
 vPC1jJ7GhPFKVH1XQEqiWRMgnwVmRgGVfeDn6Lqjj5Sls4CRiJgA3PwQQmUfawv/yFiQ3eI+dd6
 KUSu+CxUI6OQbGvvwzviQoE3G1u08bsNmIREy4/9Y+3kLSmwwh2DMQyiixwAxQpNnr0FPFArWan
 lOc59ggMbXuxMGA5E7HKo/QSJmWg64igl9IIwHNBUjNkC9vgN+lz3LwS/qHIjibUi9aeA6l09hN
 QlQ5qHqm7NNfy9ceuEQw8HDwyey7UMCRCl5rdoKhYxpEkCfhVPSdkOAdE3DdlUPo1M2CuTj6nvj
 uGA4vux2XE0WaGGMmwQ==
X-Proofpoint-GUID: mSSUaj5yF0V3_WGbh1cb4eylUW9HEY3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-114105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jie.luo@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FC36B4E3F

Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
<quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
"quicinc.com" addresses were deprecated for public work.  All Qualcomm
contributors are aware of that and were asked to fix their addresses.

Driver is not supported - in terms of how netdev understands supported
commitment - if maintainer does not care to receive the patches for its
code, so demote it to "maintained" to reflect true status.

Fix all occurences of Luo Jie email address to preferred and working
domain.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .mailmap                                                      | 3 ++-
 .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml | 2 +-
 Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml   | 2 +-
 MAINTAINERS                                                   | 4 ++--
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index 1f23ea6e8ce1..23eb9a4b04f4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -530,7 +530,8 @@ Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
 Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
 Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
-Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
+Luo Jie <jie.luo@oss.qualcomm.com> <luoj@codeaurora.org>
+Luo Jie <jie.luo@oss.qualcomm.com> <quic_luoj@quicinc.com>
 Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
 Lance Yang <lance.yang@linux.dev> <mingzhe.yang@ly.com>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index b9c3650e5c4c..a4f9af8fa187 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -8,7 +8,7 @@ title: Qualcomm CMN PLL Clock Controller on IPQ SoC
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
 
 description:
   The CMN (or common) PLL clock controller expects a reference
diff --git a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
index 3da10c364a85..8d7a58609372 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
@@ -8,7 +8,7 @@ title: Qualcomm NSS Clock & Reset Controller on QCA8386/QCA8084
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
 
 description: |
   Qualcomm NSS clock control module provides the clocks and resets
diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index 753f370b7605..6d0b21a10732 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm IPQ packet process engine (PPE)
 
 maintainers:
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
   - Lei Wei <quic_leiwei@quicinc.com>
   - Suruchi Agarwal <quic_suruchia@quicinc.com>
   - Pavithra R <quic_pavir@quicinc.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 895a87b571c3..e173828acfe1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22324,9 +22324,9 @@ F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
 QUALCOMM PPE DRIVER
-M:	Luo Jie <quic_luoj@quicinc.com>
+M:	Luo Jie <jie.luo@oss.qualcomm.com>
 L:	netdev@vger.kernel.org
-S:	Supported
+S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
 F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
 F:	drivers/net/ethernet/qualcomm/ppe/
-- 
2.53.0


