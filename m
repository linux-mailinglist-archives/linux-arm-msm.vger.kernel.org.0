Return-Path: <linux-arm-msm+bounces-67011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B7B14EBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5AFA177C9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6C682899;
	Tue, 29 Jul 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCclWLMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE783595E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796975; cv=none; b=pxEmB295B1xKX6KR9wrGiTGKi8TqSnPQpXArxzmdOq3Pg86upL0RbGoTJldJqMN4yGDMXkI/lqDLELCEaFlADi1Kp2BefdoBY8Og4k9bNQHBPExiKYGhlwhdvLjk2ZorqzQ0C/P2Nh62gllQcSiPJOtgDhGeOzoqxbWbdKUF/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796975; c=relaxed/simple;
	bh=VfKnjou+066uF1ipQsFzTRaGUjEzbSzGV7Vb3Y+JU44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQfcZ+942TjtwQ0Bb7Do3KzI7E4js6mbi4MJifD9GArODhTNDtWW9AkPDSawqiRQoejWXY5u0vuxC1mRUVnj4ciakb6nfw4iEhQmMWsoxUkVDm/0BK2+kXfl0pHDNNF6344Ckqe3fvKOnaQaiIz9jLD5g/+SHmPytzeHnpqiKO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCclWLMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T86vUL013628
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61kk5jNvxyOz0SbCumRr64fLpCAMGc4bzaNs2SIldko=; b=jCclWLMviM0feQbp
	acEOIJYxvSXPmqSbEO1+zcuhurtEkzfVmDQFQMaw2tRLwelECTUGlYgpUmyczrGB
	UxFL2KaiYFoaoZlfIcDOiZ1FkUkLZ6izeyDG2o8oft2NKGzPw+Sa9Mb/6twEGTpK
	4M2Ip/O3O47gq/o9ZGatSgOa5jPV4I4/s17fTEiwXG0fTGUv51lCpFcwbJzfEskQ
	y0M5+ZhXFvSbZKOWAWKv37cOzHJ0A25+9gWSxaIrA0p5ce03XetpY1LzUyi/g50s
	NHFYWVnahaB8cZa7cu9njRasugeGh+SNb6BdQd2W2l8ZPdO+y3z83VOA/s+zeTki
	jgf/iQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda07rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:49:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7deca3ef277so113338485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796971; x=1754401771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61kk5jNvxyOz0SbCumRr64fLpCAMGc4bzaNs2SIldko=;
        b=Ee/yuuE2WLh7m2PwZy5MzSNqkue2g0Vdj+l8EJetIN/YG0mOpFXqBVeVM0lpbcu4j3
         lGWjOeLRbeyRINQCksK3M5X6P4zgazvGrIX4zZAUpVdf4QpYmV0zVffnq0Fbxt1Tjoys
         Ej+nVGj9yEzs7GOwrF1OvHCVxy8UqWbEJxAdKFXG2R24wK34zmQRUF/R7ZNOeTd1//bG
         gdYY+LxYL4JvcvPpE12ldY4+G04sLdhUT+QczvvlWrbs2dMO4eZ2PFH8bqG+LGCJ5pwV
         j9PHP4GJAOn8qPuPIY9nM2ZyXdCduuqDR2t8bJoWpCuTPnDhOvYxRbSCQ8hxmX63mKcL
         lTbg==
X-Forwarded-Encrypted: i=1; AJvYcCX6/tYCJ9oz2fpX8Xg3ruNKz0lUNGZnfflf1vxV68MdCZM0FqtYeRqViY3lH22DSt2r2jR9Q0PsQ1KLv3dJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmpcvf+wSgGa+5m+d9VNgF9KB6WiSAr+NKAXM3UAy6J60f/Xhz
	quOra5FFRXrARRdSbtegJn1vhqNykD29RkL2kI5flK7ZHegC9/g9PZmCfljkJYtI6kcoCb1rCvj
	pAuEC4GL7+Ynmx6y7xcKmYFo8U6LjwWOrYpgMCgebR3ZDhsnQyIij0+wqJVCDR5kdUj0MDGjBoo
	WO
X-Gm-Gg: ASbGncvrnhpmio8UqKG2TOfwX46ADxvq1qaTGrHP0IJXT81hX7sHZk0YnK3ci3fQrV5
	Q80UC1areALzsGuLrZFU6Y5pOcEYnYNxVYPI5EfHrZZPOK/krwrai/Am//tjlGsLcUVsd30m7Qm
	MQ2bx0pSnACoFKp0SpLqbgW9lImhY0oPlt5N2xf9/Tdkxt8WsNfALe0r3ERWOGqB1gB98mwA1X+
	HXf1e5JWOtQudlMX8SvF9b5LHz0e8PvFa7ryQ0AmVLtPK51WI0e9q4r//G0YQ/MR6GoAT6WzK0q
	pxxpjzXFHb+idLN1qAodI/XvabKcgbymmH9kJYU4/L//PTHFkhYdjo1bstTEN2yQ2hU0qcFCgSr
	237pYlYAza3cZwcPKqg==
X-Received: by 2002:a05:620a:40cb:b0:7e6:3c4f:fff with SMTP id af79cd13be357-7e66d4b1af0mr5516185a.3.1753796970969;
        Tue, 29 Jul 2025 06:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/cjxXB3TqSvv6mMYVyunIjlcclP8mBW4l0J7rAIH3yOPfz1ez6vZZCzhqpworKGNcU2JTWA==
X-Received: by 2002:a05:620a:40cb:b0:7e6:3c4f:fff with SMTP id af79cd13be357-7e66d4b1af0mr5514385a.3.1753796970480;
        Tue, 29 Jul 2025 06:49:30 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a63121sm589037166b.67.2025.07.29.06.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:49:29 -0700 (PDT)
Message-ID: <489a1c80-e7b6-48ee-bee1-76e32a72a060@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:49:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] net: bluetooth: add callback to exe l2cap when
 read_security uncompleted
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org
Cc: quic_bt@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20250627030229.1720287-1-quic_shuaz@quicinc.com>
 <7a823b6d-767b-4777-8db0-761a2d0e09be@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7a823b6d-767b-4777-8db0-761a2d0e09be@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JPL4yP_HgiApf3OKzTfs2tNPTaBNjf0i
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6888d16c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Dei6p5SHAAAA:8 a=pGLkceISAAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=COk6AnOGAAAA:8 a=aDRfdkeckOnu_uhJLj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=M-Yerj1wOn-OpK7r_3ei:22 a=y1Q9-5lHfBjTkpIzbSAN:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JPL4yP_HgiApf3OKzTfs2tNPTaBNjf0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNiBTYWx0ZWRfX4XLGdDL4hcLO
 WGAcUvVLLpriDLexXfoxAu6aFHMn4uAWEjR8UmFgtdLDjC65JMVc1tIL4dDTPUVVV1l8TjQsMyl
 XcWJ8hHeTOH2Mhvdw4uidBl71YhCRg/RRNTnI6xUTiboDYEDKlB1x2hCeoCAE0I22MV4Y6KaG4g
 6D9O1CvEdNvlZ/1n92VvWiF7rugyzE2gFgYYt+U1jznowerzuU2/JXCNtfeIRO6O9/Ec6Ro0gRC
 Jp8RkgRVNXBF65OGoAyfjofsov+4xRyLscEOYRo7v3t+8b8g86Vw0wwCm6i1m8dMAUPLsNVr5Ib
 DqekCYG7LIWlNC7ztPBUVl6rYLMl5R4CKO/9VqUKVhWRPbl3ndO/0kn+GrpJnNhVD51UchlFt6F
 LuVGasDqr2Xhczl9glj0UNSgRMwSpIsaFeOtReRNJHlNzJnLBwiF0Do4MK9ruFswdqcUHUWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290106

On 7/7/25 9:21 AM, Shuai Zhang wrote:
> Dear all

(Please don't top-post)

It would probably help if you included the maintainers in the To/Cc
fields, so that your email can actually reach them

When using the b4 tool, you can simply run `b4 prep -c`.

Please resend this patch and add these emails:

Marcel Holtmann <marcel@holtmann.org>
Johan Hedberg <johan.hedberg@gmail.com>
Luiz Augusto von Dentz <luiz.dentz@gmail.com>
"David S. Miller" <davem@davemloft.net>
Eric Dumazet <edumazet@google.com>
Jakub Kicinski <kuba@kernel.org>
Paolo Abeni <pabeni@redhat.com>
Simon Horman <horms@kernel.org>
linux-bluetooth@vger.kernel.org
netdev@vger.kernel.org
linux-kernel@vger.kernel.org

Konrad

> 
> On 2025/6/27 11:02, Shuai Zhang wrote:
>> When the DUT receives a remote L2CAP Connection Request during the Read
>> Encryption Key Size procedure, if it fails to complete reading the
>> Encryption Key Size while processing the request, it will respond with
>> a Connection Response – Refused (security block), resulting in the
>> disconnection of the remote device.
>>
>> Use HCI_CONN_ENC_KEY_READY to determine whether
>> l2cap_connect_request is pending.
>>
>> When l2cap_connect occurs before the read_enc_key_size event, it will
>> be pending because HCI_CONN_ENC_KEY_READY has not yet been set.
>> The connection request will be processed once the read_enc_key_size
>> event completes.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  include/net/bluetooth/hci_core.h |  3 +++
>>  include/net/bluetooth/l2cap.h    | 10 +++++++++-
>>  net/bluetooth/hci_event.c        | 16 ++++++++++++++++
>>  net/bluetooth/l2cap_core.c       | 30 ++++++++++++++++++++++++++++++
>>  4 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
>> index b47c74080..db329abbf 100644
>> --- a/include/net/bluetooth/hci_core.h
>> +++ b/include/net/bluetooth/hci_core.h
>> @@ -767,6 +767,8 @@ struct hci_conn {
>>  
>>  	struct bt_codec codec;
>>  
>> +	struct l2cap_pending_connect *pending_connect;
>> +
>>  	void (*connect_cfm_cb)	(struct hci_conn *conn, u8 status);
>>  	void (*security_cfm_cb)	(struct hci_conn *conn, u8 status);
>>  	void (*disconn_cfm_cb)	(struct hci_conn *conn, u8 reason);
>> @@ -970,6 +972,7 @@ enum {
>>  	HCI_CONN_CREATE_PA_SYNC,
>>  	HCI_CONN_PA_SYNC,
>>  	HCI_CONN_PA_SYNC_FAILED,
>> +	HCI_CONN_ENC_KEY_READY,
>>  };
>>  
>>  static inline bool hci_conn_ssp_enabled(struct hci_conn *conn)
>> diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
>> index 4bb0eaedd..b1ccd56bd 100644
>> --- a/include/net/bluetooth/l2cap.h
>> +++ b/include/net/bluetooth/l2cap.h
>> @@ -679,6 +679,13 @@ struct l2cap_user {
>>  	void (*remove) (struct l2cap_conn *conn, struct l2cap_user *user);
>>  };
>>  
>> +struct l2cap_pending_connect {
>> +	struct l2cap_conn *conn;
>> +	struct l2cap_cmd_hdr cmd;
>> +	u8 data[sizeof(struct l2cap_conn_req)];
>> +	u8 rsp_code;
>> +};
>> +
>>  #define L2CAP_INFO_CL_MTU_REQ_SENT	0x01
>>  #define L2CAP_INFO_FEAT_MASK_REQ_SENT	0x04
>>  #define L2CAP_INFO_FEAT_MASK_REQ_DONE	0x08
>> @@ -976,5 +983,6 @@ void l2cap_conn_put(struct l2cap_conn *conn);
>>  
>>  int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user);
>>  void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *user);
>> -
>> +void l2cap_process_pending_connect(struct l2cap_conn *conn,
>> +				   struct l2cap_cmd_hdr *cmd, u8 *data, u8 rsp_code);
>>  #endif /* __L2CAP_H */
>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>> index c4b87bfb4..6c992f83e 100644
>> --- a/net/bluetooth/hci_event.c
>> +++ b/net/bluetooth/hci_event.c
>> @@ -32,6 +32,7 @@
>>  #include <net/bluetooth/bluetooth.h>
>>  #include <net/bluetooth/hci_core.h>
>>  #include <net/bluetooth/mgmt.h>
>> +#include <net/bluetooth/l2cap.h>
>>  
>>  #include "hci_debugfs.h"
>>  #include "hci_codec.h"
>> @@ -766,10 +767,23 @@ static u8 hci_cc_read_enc_key_size(struct hci_dev *hdev, void *data,
>>  		/* Update the key encryption size with the connection one */
>>  		if (key_enc_size && *key_enc_size != conn->enc_key_size)
>>  			*key_enc_size = conn->enc_key_size;
>> +		set_bit(HCI_CONN_ENC_KEY_READY, &conn->flags);
>>  	}
>>  
>>  	hci_encrypt_cfm(conn, status);
>>  
>> +	/*Defer l2cap_connect here if it's triggered before key size is read.*/
>> +	if (conn->pending_connect) {
>> +		struct l2cap_pending_connect *pc = conn->pending_connect;
>> +
>> +		conn->pending_connect = NULL;
>> +
>> +		bt_dev_dbg(hdev, "Defer l2cap_connect");
>> +		l2cap_process_pending_connect(pc->conn, &pc->cmd, pc->data, pc->rsp_code);
>> +
>> +		kfree(pc);
>> +	}
>> +
>>  done:
>>  	hci_dev_unlock(hdev);
>>  
>> @@ -3396,6 +3410,8 @@ static void hci_disconn_complete_evt(struct hci_dev *hdev, void *data,
>>  	if (!conn)
>>  		goto unlock;
>>  
>> +	clear_bit(HCI_CONN_ENC_KEY_READY, &conn->flags);
>> +
>>  	if (ev->status) {
>>  		mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
>>  				       conn->dst_type, ev->status);
>> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
>> index 40daa3827..c4cb60e65 100644
>> --- a/net/bluetooth/l2cap_core.c
>> +++ b/net/bluetooth/l2cap_core.c
>> @@ -3982,6 +3982,30 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>>  	struct l2cap_chan *chan = NULL, *pchan = NULL;
>>  	int result, status = L2CAP_CS_NO_INFO;
>>  
>> +	/* If encryption is requested, but the key size is not ready yet,
>> +	 * we need to wait for the key size to be ready before we can
>> +	 * proceed with the connection. We do this by deferring the
>> +	 * connection request until the key size is ready. This is done
>> +	 * by storing the connection request in the hcon->pending_connect
>> +	 * field. The connection request will be retried when the key size
>> +	 * is ready.
>> +	 */
>> +	if (test_bit(HCI_CONN_ENCRYPT, &conn->hcon->flags) &&
>> +	    !test_bit(HCI_CONN_ENC_KEY_READY, &conn->hcon->flags)) {
>> +		struct l2cap_pending_connect *pc;
>> +
>> +		pc = kzalloc(sizeof(*pc), GFP_KERNEL);
>> +		if (!pc)
>> +			return;
>> +		pc->conn = conn;
>> +		memcpy(&pc->cmd, cmd, sizeof(*cmd));
>> +		memcpy(pc->data, data, sizeof(struct l2cap_conn_req));
>> +		pc->rsp_code = rsp_code;
>> +		BT_DBG("store request and retried when keysize is ready");
>> +		conn->hcon->pending_connect = pc;
>> +		return;
>> +	}
>> +
>>  	u16 dcid = 0, scid = __le16_to_cpu(req->scid);
>>  	__le16 psm = req->psm;
>>  
>> @@ -4105,6 +4129,12 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>>  	l2cap_chan_put(pchan);
>>  }
>>  
>> +void l2cap_process_pending_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>> +				   u8 *data, u8 rsp_code)
>> +{
>> +	l2cap_connect(conn, cmd, data, rsp_code);
>> +}
>> +
>>  static int l2cap_connect_req(struct l2cap_conn *conn,
>>  			     struct l2cap_cmd_hdr *cmd, u16 cmd_len, u8 *data)
>>  {
> 
> Is there any update?
> 
> thanks,
> Shuai
> 

